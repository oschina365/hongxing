package com.oscer.hongxing;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 会员活动奖励
 *
 * @author lss
 * @version 1.4.4
 * @date 2022/8/6 17:45
 */
@Data
public class ActivityGiftVO implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 奖励积分
     */
    private BigDecimal integral;

    /**
     * 奖励成长值
     */
    private BigDecimal grow;
}
