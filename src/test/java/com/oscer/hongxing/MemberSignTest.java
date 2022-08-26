package com.oscer.hongxing;

import cn.hutool.core.collection.CollectionUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.joda.time.DateTime;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.BitFieldSubCommands;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.StringRedisTemplate;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;


/**
 * @author kz
 * @since 2022-08-04 13:48:49
 */
@SpringBootTest
public class MemberSignTest {

    @Resource
    public StringRedisTemplate stringRedisTemplate;

    /**
     * 获取两个日期之间的所有日期(字符串格式, 按天计算)
     *
     * @param startTime String 开始时间 yyyy-MM-dd
     * @param endTime  String 结束时间 yyyy-MM-dd
     * @return
     */
    public static List<String> getBetweenDays(String startTime, String endTime) throws ParseException {
        if (StringUtils.isEmpty(startTime) || StringUtils.isEmpty(endTime)) {
            return null;
        }
        // 1、定义转换格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        Date start = df.parse(startTime);
        Date end = df.parse(endTime);
        if (start == null || end == null) {
            return null;
        }
        List<String> result = new ArrayList<>();

        Calendar tempStart = Calendar.getInstance();
        tempStart.setTime(start);

        tempStart.add(Calendar.DAY_OF_YEAR, 1);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar tempEnd = Calendar.getInstance();
        tempEnd.setTime(end);
        result.add(sdf.format(start));
        while (tempStart.before(tempEnd)) {
            result.add(sdf.format(tempStart.getTime()));
            tempStart.add(Calendar.DAY_OF_YEAR, 1);
        }
        return result;
    }

    /**
     * 日期格式化 日期格式为：yyyy-MM-dd
     *
     * @param date 日期
     * @return 返回yyyy-MM-dd格式日期
     */
    public static String format(Date date) {
        return format(date, DATE_PATTERN);
    }


    /**
     * 当前日期是否符合连签
     *
     * @param memberActivityInfo 会员活动信息
     * @param continueSignCount  连签天数
     * @param startDate          活动开始日期
     * @param endDate            活动结束日期
     * @return {@link ActivityRelationRuleVO}
     */
    private static List<String> getRewardDays(MemberActivityInfo memberActivityInfo, int continueSignCount, String startDate, String endDate) {
        // 连续签到奖励规则
        List<MemberActivityRuleInfo> activityRuleInfoList = memberActivityInfo.getMemberActivityRuleInfoList();
        SimpleDateFormat format = new SimpleDateFormat(DATE_PATTERN);
        Map<Integer, List<String>> ruleMap = new HashMap<>();
        List<String> allRewardDays = new ArrayList<>();
        try {
            Calendar startPeriod = Calendar.getInstance();
            startPeriod.setTime(format.parse(startDate));
            Calendar editEndPeriod = Calendar.getInstance();
            editEndPeriod.setTime(format.parse(endDate));
            if (CollectionUtil.isNotEmpty(activityRuleInfoList)) {
                String nowDate = format(new Date());
                while (startPeriod.before(editEndPeriod)) {
                    startPeriod.add(Calendar.DATE, 1);
                    if (startPeriod.getTime().before(new Date())) {
                        continue;
                    }
                    String currentDay = format.format(startPeriod.getTime());
                    List<String> betweenDays = getBetweenDays(currentDay, nowDate);
                    int daySize = CollectionUtil.isEmpty(betweenDays) ? 0 : betweenDays.size();
                    ActivityRelationRuleVO ruleVO = getActivityRelationRuleVO(memberActivityInfo,
                            (daySize + continueSignCount));
                    if (ruleVO == null) {
                        continue;
                    }
                    List<String> rewardDays = ruleMap.get(ruleVO.getContinuousSignDays());
                    if (CollectionUtil.isEmpty(rewardDays)) {
                        rewardDays = new ArrayList<>();
                    }
                    if (ruleVO.getContinuousSignDays() >= rewardDays.size()) {
                        rewardDays.add(currentDay);
                        allRewardDays.add(currentDay);
                    }
                    ruleMap.put(ruleVO.getContinuousSignDays(), rewardDays);
                }
            }
        }catch (Exception e){

        }
        return allRewardDays;
    }

    /**
     * 按照连续签到天数进行升序
     *
     * @param ruleInfoList 会员活动规则表
     * @return {@link List}
     */
    private static List<MemberActivityRuleInfo> orderBySignDay(List<MemberActivityRuleInfo> ruleInfoList) {
        if (CollectionUtil.isEmpty(ruleInfoList)) {
            return Collections.emptyList();
        }
        // 升序排列
        ruleInfoList.sort((a, b) ->
                a.getActivityRelationRule().getContinuousSignDays() - b.getActivityRelationRule().getContinuousSignDays()
        );
        return ruleInfoList;
    }

    /**
     * 获取符合连签条件的连签规则
     *
     * @param memberActivityInfo 会员活动信息
     * @param continueSignCount  连签天数
     * @return {@link ActivityRelationRuleVO}
     */
    private static ActivityRelationRuleVO getActivityRelationRuleVO(MemberActivityInfo memberActivityInfo, int continueSignCount) {
        if (continueSignCount <= 1) {
            return null;
        }
        ActivityRuleVO activityRule = memberActivityInfo.getActivityRule();
        ActivityRelationRuleVO relationRuleVO = null;
        // 符合连签的集合
        List<MemberActivityRuleInfo> conditionRuleInfoList = new ArrayList<>();
        if (activityRule == null
                || !Objects.equals(1, memberActivityInfo.getActivityRule().getContinuousSignStatus())) {
            return null;
        }
        // 连续签到奖励规则
        List<MemberActivityRuleInfo> ruleInfoList = orderBySignDay(memberActivityInfo.getMemberActivityRuleInfoList());
        if (CollectionUtil.isNotEmpty(ruleInfoList)) {
            for (MemberActivityRuleInfo memberActivityRuleInfo : ruleInfoList) {
                relationRuleVO = memberActivityRuleInfo.getActivityRelationRule();
                // 签到任务领取上限
                Integer receiveLimit = relationRuleVO.getReceiveLimit();
                // 该规则需要连续签到的天数
                Integer continuousSignDays = relationRuleVO.getContinuousSignDays();
                if (receiveLimit == null || receiveLimit <= 0) {
                    // 不限领
                    if (continueSignCount % continuousSignDays == 0) {
                        conditionRuleInfoList.add(memberActivityRuleInfo);
                    }
                } else {
                    if (continueSignCount % continuousSignDays == 0
                            && (continueSignCount / continuousSignDays) <= receiveLimit) {
                        conditionRuleInfoList.add(memberActivityRuleInfo);
                    }
                }
            }
        }
        if (CollectionUtil.isNotEmpty(conditionRuleInfoList)) {
            conditionRuleInfoList = orderBySignDay(conditionRuleInfoList);
            relationRuleVO = conditionRuleInfoList.get(conditionRuleInfoList.size() - 1).getActivityRelationRule();
        }
        return relationRuleVO;
    }

    public static void main(String[] args) throws ParseException {

        String s = "{\"createTime\":\"2022-08-23 22:03:55\",\"updateTime\":\"2022-08-23 23:05:18\",\"creator\":\"18086497823\",\"modifier\":\"18086497823\",\"id\":\"1\",\"tenantCode\":\"10000141\",\"activityCode\":null,\"activityName\":\"签到\",\"describeInfo\":\"1.每日签到可以获得日签奖励，连续签到可以获得连签奖励； 2.每日最多可签到1次，断签不需要重新从头签到，但会重新计算连签天数； 3.活动以及奖励最终解释权归商家所有。\",\"activityType\":7,\"subType\":2,\"limitValue\":20,\"startTime\":null,\"endTime\":null,\"useShop\":null,\"isNotice\":0,\"activityStatus\":2,\"userScope\":null,\"activityRuleJson\":\"{\\\"continuousSignStatus\\\":1}\",\"activityGiftJson\":\"{\\\"integral\\\":1,\\\"grow\\\":1}\",\"isDelete\":0,\"memberActivityRuleInfoList\":[{\"createTime\":\"2022-08-23 23:05:18\",\"updateTime\":\"2022-08-23 23:05:18\",\"creator\":\"18086497823\",\"modifier\":\"18086497823\",\"id\":\"16\",\"tenantCode\":\"10000141\",\"activityId\":\"1\",\"ruleJson\":\"{\\\"continuousSignDays\\\":2,\\\"integral\\\":1,\\\"grow\\\":1,\\\"receiveLimit\\\":0}\",\"giftJson\":null,\"activityRelationRule\":{\"continuousSignDays\":2,\"integral\":1,\"grow\":1,\"receiveLimit\":0}},{\"createTime\":\"2022-08-23 23:05:18\",\"updateTime\":\"2022-08-23 23:05:18\",\"creator\":\"18086497823\",\"modifier\":\"18086497823\",\"id\":\"17\",\"tenantCode\":\"10000141\",\"activityId\":\"1\",\"ruleJson\":\"{\\\"continuousSignDays\\\":3,\\\"integral\\\":2,\\\"grow\\\":\\\"\\\",\\\"receiveLimit\\\":0}\",\"giftJson\":null,\"activityRelationRule\":{\"continuousSignDays\":3,\"integral\":2,\"grow\":null,\"receiveLimit\":0}},{\"createTime\":\"2022-08-23 23:05:18\",\"updateTime\":\"2022-08-23 23:05:18\",\"creator\":\"18086497823\",\"modifier\":\"18086497823\",\"id\":\"18\",\"tenantCode\":\"10000141\",\"activityId\":\"1\",\"ruleJson\":\"{\\\"continuousSignDays\\\":4,\\\"integral\\\":\\\"\\\",\\\"grow\\\":1,\\\"receiveLimit\\\":1}\",\"giftJson\":null,\"activityRelationRule\":{\"continuousSignDays\":4,\"integral\":null,\"grow\":1,\"receiveLimit\":1}}],\"createStartTime\":null,\"createEndTime\":null,\"stayPageTime\":null,\"activityRule\":{\"continuousSignStatus\":1,\"jumpLink\":null,\"stayPageTime\":null},\"activityGift\":{\"integral\":1,\"grow\":1}}";
        MemberActivityInfo info = JSONObject.parseObject(s,MemberActivityInfo.class);
        List<String> rewardDays = getRewardDays(info, 1, "2022-08-24", "2022-09-20");
        System.out.println(rewardDays);
    }

    /**
     * 获取连续签到天数
     *
     * @return {@link int}
     */
    @Test
    public void getSingCount() {
        String key = "business:10000001:member_sign_count:574104:202208";
        Boolean bit = stringRedisTemplate.opsForValue().getBit(key, 22);
        System.out.println(bit);
       /* Date currentDate = new Date();
        Date lastMonth = addDateMonths(currentDate, -1);
        Date lastLastMonth = addDateMonths(currentDate, -2);
        // 考虑极端情况跨月下的连续签到天数，正常情况下跨2个月
        int i = getSignCount(format(currentDate, DATE_PATTERN))
                + getSignCount1(format(lastMonth, DATE_PATTERN))
                + getSignCount2(format(lastLastMonth, DATE_PATTERN));
        System.out.println(i);*/
    }

    /**
     * 对日期的【天】进行加/减
     *
     * @param date 日期
     * @param days 天数，负数为减
     * @return 加/减几天后的日期
     */
    public Date addDateDays(Date date, int days) {
        DateTime dateTime = new DateTime(date);
        return dateTime.plusDays(days).toDate();
    }

    @Test
    public void signDetail() {
        String s = "{\"createTime\":\"2022-08-22 17:34:32\",\"updateTime\":\"2022-08-22 17:34:32\",\"creator\":\"18086497823\",\"modifier\":\"18086497823\",\"id\":\"14\",\"tenantCode\":\"10000001\",\"activityCode\":null,\"activityName\":\"签到\",\"describeInfo\":\"1.每日签到可以获得日签奖励，连续签到可以获得连签奖励； 2.每日最多可签到1次，断签不需要重新从头签到，但会重新计算连签天数； 3.活动以及奖励最终解释权归商家所有。\",\"activityType\":7,\"subType\":2,\"limitValue\":25,\"startTime\":null,\"endTime\":null,\"useShop\":null,\"isNotice\":0,\"activityStatus\":2,\"userScope\":null,\"activityRuleJson\":\"{\\\"continuousSignStatus\\\":1}\",\"activityGiftJson\":\"{\\\"integral\\\":2,\\\"grow\\\":2}\",\"isDelete\":0,\"memberActivityRuleInfoList\":[{\"createTime\":\"2022-08-22 17:34:32\",\"updateTime\":\"2022-08-22 17:34:32\",\"creator\":\"18086497823\",\"modifier\":\"18086497823\",\"id\":\"1\",\"tenantCode\":\"10000001\",\"activityId\":\"14\",\"ruleJson\":\"{\\\"continuousSignDays\\\":2,\\\"integral\\\":1,\\\"grow\\\":1,\\\"receiveLimit\\\":1}\",\"giftJson\":null,\"activityRelationRule\":{\"continuousSignDays\":2,\"integral\":1,\"grow\":1,\"receiveLimit\":1}},{\"createTime\":\"2022-08-22 17:34:32\",\"updateTime\":\"2022-08-22 17:34:32\",\"creator\":\"18086497823\",\"modifier\":\"18086497823\",\"id\":\"2\",\"tenantCode\":\"10000001\",\"activityId\":\"14\",\"ruleJson\":\"{\\\"continuousSignDays\\\":3,\\\"integral\\\":1,\\\"grow\\\":\\\"\\\",\\\"receiveLimit\\\":1}\",\"giftJson\":null,\"activityRelationRule\":{\"continuousSignDays\":3,\"integral\":1,\"grow\":null,\"receiveLimit\":1}},{\"createTime\":\"2022-08-22 17:34:32\",\"updateTime\":\"2022-08-22 17:34:32\",\"creator\":\"18086497823\",\"modifier\":\"18086497823\",\"id\":\"3\",\"tenantCode\":\"10000001\",\"activityId\":\"14\",\"ruleJson\":\"{\\\"continuousSignDays\\\":4,\\\"integral\\\":\\\"\\\",\\\"grow\\\":1,\\\"receiveLimit\\\":0}\",\"giftJson\":null,\"activityRelationRule\":{\"continuousSignDays\":4,\"integral\":null,\"grow\":1,\"receiveLimit\":1}}],\"createStartTime\":null,\"createEndTime\":null,\"stayPageTime\":null,\"activityRule\":{\"continuousSignStatus\":1,\"jumpLink\":null,\"stayPageTime\":null},\"activityGift\":{\"integral\":2,\"grow\":2}}";
        MemberActivityInfo memberActivityInfo = JSONObject.parseObject(s, MemberActivityInfo.class);
        if (memberActivityInfo == null) {
            System.out.println("签到活动未开启");
        }
        String startDate = null;
        String endDate = null;


        // 考虑极端情况跨月下的连续签到天数，正常情况下跨2个月
        Date currentDate = new Date();
        Date lastMonth = addDateMonths(currentDate, -1);
        Date lastLastMonth = addDateMonths(currentDate, -2);
        // 考虑极端情况跨月下的连续签到天数，正常情况下跨2个月
        int continuousDays = getSignCount(format(currentDate, DATE_PATTERN))
                + getSignCount1(format(lastMonth, DATE_PATTERN))
                + getSignCount2(format(lastLastMonth, DATE_PATTERN));
        System.out.println(continuousDays);
        // 判断是否是周期签到
        if (Objects.equals(2, memberActivityInfo.getSubType())) {
            Integer limitValue = memberActivityInfo.getLimitValue();
            Date firstSignDay = addDateDays(new Date(), (continuousDays-1) * -1);
            startDate = format(firstSignDay, DATE_PATTERN);
            endDate = format(addDateDays(firstSignDay, limitValue), DATE_PATTERN);
        }
        // 连续签到奖励规则
        List<MemberActivityRuleInfo> activityRuleInfoList = memberActivityInfo.getMemberActivityRuleInfoList();
        List<String> rewardDays = new ArrayList<>();
        if (CollectionUtil.isNotEmpty(activityRuleInfoList)) {
            for (MemberActivityRuleInfo memberActivityRuleInfo : activityRuleInfoList) {
                ActivityRelationRuleVO relationRuleVO = memberActivityRuleInfo.getActivityRelationRule();
                // 该规则需要连续签到的天数
                Integer continuousSignDays = relationRuleVO.getContinuousSignDays();
                if (continuousDays < continuousSignDays) {
                    continue;
                }
                Date rewardDay = addDateDays(new Date(), (continuousSignDays - continuousDays));
                rewardDays.add(format(rewardDay, DATE_PATTERN));
            }
        }
        SimpleDateFormat format = new SimpleDateFormat(DATE_PATTERN);
        List<AppMemberSignCountVO> memberSignCountVOList = new ArrayList<>();
        try {
            Calendar startPeriod = Calendar.getInstance();
            startPeriod.setTime(format.parse(startDate));
            Calendar editEndPeriod = Calendar.getInstance();
            editEndPeriod.setTime(format.parse(endDate));
            while (startPeriod.before(editEndPeriod)) {
                AppMemberSignCountVO signCountVO = new AppMemberSignCountVO();
                String currentDay = format.format(startPeriod.getTime());
                signCountVO.setCurrentDay(currentDay);
                LocalDateTime dateOfSign = parseLocalDateTime(currentDay);
                String cacheKey = "business:10000001:member_sign_count:574104:202208";
                Boolean isSign = stringRedisTemplate.opsForValue().getBit(cacheKey, dateOfSign.getDayOfMonth() - 1);
                signCountVO.setIsSign(isSign != null && isSign ? 1 : 0);
                Integer isContinueSign = rewardDays.contains(currentDay) ? 1 : 0;
                signCountVO.setIsContinueSign(isContinueSign);
                memberSignCountVOList.add(signCountVO);
                startPeriod.add(Calendar.DATE, 1);
            }
        } catch (ParseException e) {
        }
        System.out.println(JSONObject.toJSONString(memberSignCountVOList));
    }

    /**
     * 日期格式化 日期格式为：yyyy-MM-dd
     *
     * @param date    日期
     * @param pattern 格式，如：DateUtils.DATE_TIME_PATTERN
     * @return 返回yyyy-MM-dd格式日期
     */
    public static String format(Date date, String pattern) {
        if (date != null) {
            SimpleDateFormat df = new SimpleDateFormat(pattern);
            return df.format(date);
        }
        return null;
    }

    /**
     * 对日期的【月】进行加/减
     *
     * @param date   日期
     * @param months 月数，负数为减
     * @return 加/减几月后的日期
     */
    public static Date addDateMonths(Date date, int months) {
        DateTime dateTime = new DateTime(date);
        return dateTime.plusMonths(months).toDate();
    }


    /**
     * 签到
     */
    public void doSign() {
        //用户Uid
        String userId = "1234";
        //获取当前日期
        LocalDateTime now = LocalDateTime.now();
        String keySuffix = now.format(DateTimeFormatter.ofPattern(":yyyyMM"));
        // 组合成key= sign:userId:年月
        String key = "sign:" + userId + keySuffix;
        // 获取当前日期是当月的第多少天
        int dayOfMonth = now.getDayOfMonth();
        // 存到redis中的bitmap中，由于bitmap从0开始，第多少天从1开始，dayOfMonth需要减1
        stringRedisTemplate.opsForValue().setBit(key, dayOfMonth - 1, true);
    }

    /**
     * 获取当前日期是否签到
     *
     * @return
     */
    @Test
    public void getSignDay() {
        String signDate = "20220822";
        String userId = "1234";
        LocalDateTime dateOfSign = StringParseLocalDateTime(signDate);
        //获取当前日期
        int dayOfMonth = dateOfSign.getDayOfMonth();
        String keySuffix = dateOfSign.format(DateTimeFormatter.ofPattern(":yyyyMM"));
        String key = "sign:" + userId + keySuffix;
        System.out.println(stringRedisTemplate.opsForValue().getBit(key, dayOfMonth - 1));
    }

    /**
     * 指定日期补签
     *
     * @return
     */
    @Test
    public void doSupplementarySignature() {
        String signDate = "20220822";
        LocalDateTime dateOfSign = StringParseLocalDateTime(signDate);
        String keySuffix = dateOfSign.format(DateTimeFormatter.ofPattern(":yyyyMM"));
        String key = "business:10000001:member_sign_count:574104:202208";
        int dayOfMonth = dateOfSign.getDayOfMonth();
        System.out.println(stringRedisTemplate.opsForValue().setBit(key, dayOfMonth - 1, true));
    }

    /**
     * 统计指定月的用户总共签到次数
     * date：年月日
     *
     * @return
     */
    @Test
    public void getSignCount() {
        String date = "20220804";
        String key = "business:10000001:member_sign_count:574104:202208";
        LocalDateTime dateOfSign = StringParseLocalDateTime(date);
        String keySuffix = dateOfSign.format(DateTimeFormatter.ofPattern(":yyyyMM"));
        Long count = stringRedisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection redisConnection) throws DataAccessException {
                return redisConnection.bitCount(key.getBytes());
            }
        });
        assert count != null;
        System.out.println(String.format("总共签到%s次", count.intValue()));
    }

    /**
     * 字符串日期转换成LocalDateTime
     *
     * @param date yyyy-MM-dd形式的日期
     * @return {@link LocalDateTime}
     */
    public static LocalDateTime parseLocalDateTime(String date) {
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_PATTERN);
            Date parse = simpleDateFormat.parse(date);
            Instant instant = parse.toInstant();
            ZoneId zoneId = ZoneId.systemDefault();
            return instant.atZone(zoneId).toLocalDateTime();
        } catch (Exception e) {
            throw new RuntimeException("日期格式转换报错");
        }
    }

    /**
     * 统计指定月的用户总共签到次数
     *
     * @param date 年月日
     * @return {@link int}
     */
    public int getSignCount(String date) {
        try {
            String key = "business:10000001:member_sign_count:574104:202208";
            System.out.println("111:" + key);
            // 获取当前日期是当月的第多少天
            int dayOfMonth = parseLocalDateTime(date).getDayOfMonth();
            // 获取本月截止今天为止的所有签到记录，返回的是一个十进制的数字
            List<Long> signCountList = stringRedisTemplate.opsForValue().bitField(key, BitFieldSubCommands.create()
                    .get(BitFieldSubCommands.BitFieldType.unsigned(dayOfMonth)).valueAt(0));

            if (CollectionUtil.isEmpty(signCountList)) {
                return 0;
            }
            Long number = signCountList.get(0);
            if (number == null || number == 0) {
                return 0;
            }
            int signCount = 0;
            long v = signCountList.get(0) == null ? 0 : signCountList.get(0);
            // i 表示操作次数
            for (int i = dayOfMonth; i > 0; i--) {
                // 右移再左移 ，如果等于自己说明最低位=0，说明未签到
                if (v >> 1 << 1 == v) {
                    if (i != dayOfMonth) {
                        break;
                    }

                } else {
                    signCount++;
                }
                // 右移一位并重新赋值，相当于最低位丢弃一位
                v >>= 1;
            }
            return signCount;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 统计指定月的用户总共签到次数
     *
     * @param date 年月日
     * @return {@link int}
     */
    public int getSignCount1(String date) {
        try {
            String key = "business:10000001:member_sign_count:574104:202207";
            System.out.println("222:" + key);
            // 获取当前日期是当月的第多少天
            int dayOfMonth = parseLocalDateTime(date).getDayOfMonth();
            // 获取本月截止今天为止的所有签到记录，返回的是一个十进制的数字
            List<Long> signCountList = stringRedisTemplate.opsForValue().bitField(key, BitFieldSubCommands.create()
                    .get(BitFieldSubCommands.BitFieldType.unsigned(dayOfMonth)).valueAt(0));

            if (CollectionUtil.isEmpty(signCountList)) {
                return 0;
            }
            Long number = signCountList.get(0);
            if (number == null || number == 0) {
                return 0;
            }
            int signCount = 0;
            // 可能该用户这个月就没有签到过,需要判断一下,如果是空就给一个默认值0
            long count = signCountList.get(0) == null ? 0 : signCountList.get(0);
            for (int i = 0; i < dayOfMonth; i++) {
                // 如果是连续签到得到的long值右移一位再左移一位后与原始值不相等,连续天数加1
                if (count >> 1 << 1 == count) {
                    return signCount;
                }
                signCount += 1;
                count >>= 1;
            }
            return signCount;
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * 统计指定月的用户总共签到次数
     *
     * @param date 年月日
     * @return {@link int}
     */
    public int getSignCount2(String date) {
        try {
            String key = "business:10000001:member_sign_count:574104:202206";
            System.out.println("333:" + key);
            // 获取当前日期是当月的第多少天
            int dayOfMonth = parseLocalDateTime(date).getDayOfMonth();
            // 获取本月截止今天为止的所有签到记录，返回的是一个十进制的数字
            List<Long> signCountList = stringRedisTemplate.opsForValue().bitField(key, BitFieldSubCommands.create()
                    .get(BitFieldSubCommands.BitFieldType.unsigned(dayOfMonth)).valueAt(0));

            if (CollectionUtil.isEmpty(signCountList)) {
                return 0;
            }
            Long number = signCountList.get(0);
            if (number == null || number == 0) {
                return 0;
            }
            int signCount = 0;
            // 可能该用户这个月就没有签到过,需要判断一下,如果是空就给一个默认值0
            long count = signCountList.get(0) == null ? 0 : signCountList.get(0);
            for (int i = 0; i < dayOfMonth; i++) {
                // 如果是连续签到得到的long值右移一位再左移一位后与原始值不相等,连续天数加1
                if (count >> 1 << 1 == count) {
                    return signCount;
                }
                signCount += 1;
                count >>= 1;
            }
            return signCount;
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * 统计当前日期往前的连续签到数（连续的）
     *
     * @return
     */
    @Test
    public void signCount() {
        //获取当前日期
        LocalDateTime now = LocalDateTime.now();
        // 组合成key= sign:userId:年月
        String key = "business:10000001:member_sign_count:574104:202208";
        // 获取当前日期是当月的第多少天
        int dayOfMonth = now.getDayOfMonth();
        // 获取本月截止今天为止的所有签到记录，返回的是一个十进制的数字
        List<Long> result = stringRedisTemplate.opsForValue().bitField(key, BitFieldSubCommands.create()
                .get(BitFieldSubCommands.BitFieldType.unsigned(dayOfMonth)).valueAt(0));

        if (result == null || result.isEmpty()) {
            System.out.println(0);
        }
        Long number = result.get(0);
        int count = 0;
        if (number == null || number == 0) {
            System.out.println(0);
        }
        while (true) {
            // 让这个数字与1做与运算，得到数字的最后一位bit，并判断这个bit是否为0
            if ((number & 1) == 0) {
                // 如果为0说明不是连续签到，直接终止
                break;
            } else {
                // 如果不为0，那就为1，说明有签到，继续下次循环，并且计数器加一
                count++;
            }
            // 把数字右移一位，抛弃最后一位的bit，继续下一个bit
            number = number >>> 1; // 也可以写成 number >>>= 1
        }
        System.out.println(String.format("当前连续签到数%s次", count));
    }


    /**
     * 计算用户当前月份签到天数
     */
    public void listUserMonthSign() {
        //用户Uid
        String userId = "1234";
        //获取当前日期
        LocalDateTime now = LocalDateTime.now();
        String keySuffix = now.format(DateTimeFormatter.ofPattern(":yyyyMM"));
        // 组合成key= sign:userId:年月
        String key = "sign:" + userId + keySuffix;
    }

    /**
     * 时间格式(yyyy-MM-dd)
     */
    public static final String DATE_PATTERN = "yyyy-MM-dd";

    public void distanceDay() {
        String startDate = "2022-06-27";
        String endDate = "2022-08-07";
        SimpleDateFormat format = new SimpleDateFormat(DATE_PATTERN);
        SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Calendar startPeriod = Calendar.getInstance();
            startPeriod.setTime(format.parse(startDate));
            Calendar editEndPeriod = Calendar.getInstance();
            editEndPeriod.setTime(format.parse(endDate));
            while (startPeriod.before(editEndPeriod)) {
                System.out.println(dayFormat.format(startPeriod.getTime()));
                startPeriod.add(Calendar.DATE, 1);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }


    /**
     * 字符串日期转换成LocalDateTime
     *
     * @param date
     * @return
     */
    private LocalDateTime StringParseLocalDateTime(String date) {
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
            Date parse = simpleDateFormat.parse(date);
            Instant instant = parse.toInstant();
            ZoneId zoneId = ZoneId.systemDefault();
            return instant.atZone(zoneId).toLocalDateTime();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("日期格式转换报错");
        }
    }

}


