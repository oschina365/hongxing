package com.oscer.hongxing.bean;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.common.Inflector;
import com.oscer.hongxing.db.CacheMgr;
import com.oscer.hongxing.db.DBException;
import com.oscer.hongxing.db.DbQuery;
import lombok.Data;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 数据库对象的基类
 *
 * @author winterlau
 */
@Data
public abstract class Entity implements Serializable {

    /**
     * 正常=0  冻结=1
     */
    public final static transient int STATUS_NORMAL = 0;
    public final static transient int STATUS_FROZEN = 1;
    /**
     * 用户在线
     */
    public final static transient int ONLINE = 1;
    /**
     * 用户下线
     */
    public final static transient int OFFLINE = 0;

    /**
     * 添加时间
     */
    public Date create_time;
    /**
     * 更新时间
     */
    public Date update_time;

    /**
     * 创建者ID
     */
    private int creator;
    /**
     * 更新者ID
     */
    private int updater;

    @Target(ElementType.TYPE)
    @Retention(RetentionPolicy.RUNTIME)
    public @interface Cache {
        String region();

        boolean cacheNull() default true;
    }

    protected final static transient String OBJ_COUNT_CACHE_KEY = "#";
    public Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 返回对象对应的缓存区域名
     *
     * @return
     */
    public String CacheRegion() {
        return this.getClass().getSimpleName();
    }

    /**
     * 对象是否存在
     *
     * @param e
     * @return
     */
    public boolean notNullObject(Entity e) {
        if (e != null && e.getId() > 0) {
            return true;
        }
        return false;
    }

    /**
     * 分页列出所有对象
     *
     * @param page
     * @param size
     * @return
     */
    public List<? extends Entity> list(int page, int size) {
        String sql = "SELECT * FROM " + rawTableName() + " ORDER BY id DESC";
        return DbQuery.get(databaseName()).query_slice(getClass(), sql, page, size);
    }

    /**
     * 分页列出所有对象
     *
     * @return
     */
    public List<Long> listIds() {
        String sql = "SELECT id FROM " + rawTableName() + " ORDER BY id DESC";
        return DbQuery.get(databaseName()).query(Long.class, sql);
    }

    /**
     * 分页列出所有对象
     *
     * @param page
     * @param size
     * @return
     */
    public List<Long> listIds(int page, int size) {
        String sql = "SELECT id FROM " + rawTableName() + " ORDER BY id DESC";
        return DbQuery.get(databaseName()).query_slice(Long.class, sql, page, size);
    }

    /**
     * 查询所有对象
     *
     * @return
     */
    public List<? extends Entity> list(boolean fromCache) {
        String sql = "SELECT * FROM " + rawTableName();
        if (!fromCache) {
            return DbQuery.get(databaseName()).query(getClass(), sql);
        }
        sql = "SELECT id FROM " + rawTableName();
        List<Long> ids = DbQuery.get(databaseName()).query(long.class, sql);
        return loadList(ids);
    }

    public List<? extends Entity> filter(String filter) {
        String sql = "SELECT id FROM " + rawTableName() + " WHERE " + filter + " ORDER BY id DESC";
        List<Long> longs = DbQuery.get(databaseName()).query(long.class, sql);
        return loadList(longs);
    }

    public List<? extends Entity> filter(String filter, Object param, String order) {
        String sql = "SELECT id FROM " + rawTableName() + " WHERE " + filter + "=?  ORDER BY ?";
        List<Long> longs = DbQuery.get(databaseName()).query(long.class, sql, param, order);
        return loadList(longs);
    }

    public List<? extends Entity> filter(String filter, Object param) {
        String sql = "SELECT id FROM " + rawTableName() + " WHERE " + filter + "=? ";
        List<Long> longs = DbQuery.get(databaseName()).query(long.class, sql, param);
        return loadList(longs);
    }

    public List<? extends Entity> filter(String filter, int page, int size) {
        String sql = "SELECT * FROM " + rawTableName() + " WHERE " + filter + " ORDER BY id DESC";
        return DbQuery.get(databaseName()).query_slice(getClass(), sql, page, size);
    }

    /**
     * 统计此对象的总记录数
     *
     * @return
     */
    public int totalCount(String field, Object param) {
        return DbQuery.get(databaseName()).stat("SELECT COUNT(*) FROM " + rawTableName() + " WHERE " + field + " = ?", param);
    }

    public static void evictCache(String cache, String key) {
        CacheMgr.evict(cache, key);
    }


    /**
     * 返回默认的对象对应的表名
     *
     * @return
     */
    public final String rawTableName() {
        String schemaName = schemaName();
        return (schemaName != null) ? "`" + schemaName + "`." + tableName() : tableName();
    }

    protected String tableName() {
        return Inflector.getInstance().tableize(getClass());
    }

    protected String schemaName() {
        return null;
    }

    protected String databaseName() {
        return "mysql";
    }

    /**
     * 插入对象到数据库表中
     *
     * @return
     */
    public long save() {
        return save(true);
    }

    /**
     * 插入对象到数据库表中
     *
     * @return
     */
    public long save(boolean evict) {
        Long id = getId();
        if (id != null && getId() > 0) {
            _InsertObject(this);
        } else {
            setId(_InsertObject(this));
        }

        if (evict && this.cachedByID()) {
            CacheMgr.evict(cacheRegion(), OBJ_COUNT_CACHE_KEY);
            if (cacheNullObject()) {
                CacheMgr.evict(cacheRegion(), String.valueOf(getId()));
            }
        }
        return getId();
    }

    /**
     * 根据id主键删除对象
     *
     * @return
     */
    public boolean delete() {
        boolean dr = evict(DbQuery.get(databaseName()).update("DELETE FROM " + rawTableName() + " WHERE id=?", getId()) == 1);
        if (dr && cachedByID()) {
            CacheMgr.evict(cacheRegion(), OBJ_COUNT_CACHE_KEY);
        }
        return dr;
    }

    /**
     * 根据id主键删除对象
     *
     * @return
     */
    public boolean deleteField(String field, Object value) {
        String sql = "DELETE  FROM " + rawTableName() + " WHERE " + field + "=? ";
        return DbQuery.get(databaseName()).update(sql, value) > 0;
    }


    /**
     * 根据id主键删除对象
     *
     * @return
     */
    public boolean delete(long id) {
        boolean dr = evict(DbQuery.get(databaseName()).update("DELETE FROM " + rawTableName() + " WHERE id=?", id) == 1);
        if (dr && cachedByID()) {
            CacheMgr.evict(cacheRegion(), OBJ_COUNT_CACHE_KEY);
            CacheMgr.evict(cacheRegion(), String.valueOf(id));
        }
        return dr;
    }

    public boolean deleteBatch(List<Long> ids) {
        for (Long id : ids) {
            delete(id);
        }
        return true;
    }

    public boolean saveBatch(List<? extends Entity> entities) {
        for (Entity it : entities) {
            it.save(false);
        }
        return true;
    }

    /**
     * 批量删除
     *
     * @param ids 删除的id
     * @return 删除的个数
     */
    public boolean batchDelete(List<Long> ids) {
        if (CollectionUtil.isEmpty(ids)) {
            return false;
        }
        StringBuilder sql = new StringBuilder("DELETE FROM " + tableName()
                + " WHERE id IN (");
        for (int i = 1; i <= ids.size(); i++) {
            sql.append('?');
            if (i < ids.size()) {
                sql.append(',');
            }
        }
        sql.append(')');
        int result = DbQuery.get(databaseName()).update(sql.toString(), ids.toArray(new Object[ids.size()]));
        if (cachedByID()) {
            for (Long id : ids) {
                CacheMgr.evict(cacheRegion(), String.valueOf(id));
            }
        }
        return result > 0;
    }


    /**
     * 批量插入数据(sql最大限制长度为8M,请根据sql长度节约使用)
     *
     * @param pojoList 列表
     * @param <T>      实体
     * @return 插入的数量
     */
    public <T extends Entity> int batchSave(List<T> pojoList) {
        if (pojoList == null || pojoList.isEmpty()) {
            return 0;
        }
        //列出每个实体的字段:值的map
        List<Map<String, Object>> pojo_bean_list = pojoList
                .stream()
                .filter(pojo -> pojo != null)
                .map(T::listInsertableFields)
                .collect(Collectors.toList());
        Map<String, Object> objectMap = pojo_bean_list.get(0);
        String[] fields = objectMap.keySet().toArray(
                new String[objectMap.size()]);

        PreparedStatement ps = null;
        try {
            ps = DbQuery.get(databaseName()).conn().prepareStatement(BuildBatchSaveSql(fields, pojo_bean_list.size()),
                    PreparedStatement.RETURN_GENERATED_KEYS);
            int i = 0;
            for (Map<String, Object> pojo_bean : pojo_bean_list) {
                for (String field : fields) {
                    ps.setObject(++i, pojo_bean.get(field));
                }
            }
            return ps.executeUpdate();
        } catch (SQLException e) {
            throw new DBException(e);
        } finally {
            DbUtils.closeQuietly(ps);
        }
    }

    private String BuildBatchSaveSql(String[] fields, int listSize) {
        StringBuilder sql = new StringBuilder("INSERT INTO ");
        sql.append(tableName());
        sql.append("(`");
        for (int i = 0; i < fields.length; i++) {
            if (i > 0) {
                sql.append("`,`");
            }
            sql.append(StrUtil.toUnderlineCase(fields[i]));
        }
        sql.append("`) VALUES");
        for (int j = 0; j < listSize; j++) {
            sql.append("(");
            for (int i = 0; i < fields.length; i++) {
                if (i > 0) {
                    sql.append(',');
                }
                sql.append('?');
            }
            sql.append(')');
            sql.append(',');
        }
        return sql.substring(0, sql.lastIndexOf(","));
    }

    public boolean updateBatchById(List<? extends Entity> entities) {
        for (Entity it : entities) {
            it.doUpdate(true);
        }
        return true;
    }

    /**
     * 根据条件决定是否清除对象缓存
     *
     * @param er
     * @return
     */
    public boolean evict(boolean er) {
        if (er && cachedByID()) {
            CacheMgr.evict(cacheRegion(), String.valueOf(getId()));
        }
        return er;
    }

    /**
     * 清除指定主键的对象缓存
     *
     * @param obj_id
     */
    public void evict(long obj_id) {
        CacheMgr.evict(cacheRegion(), String.valueOf(obj_id));
    }

    /**
     * 根据主键读取对象详细资料，根据预设方法自动判别是否需要缓存
     *
     * @param id
     * @return
     */
    @SuppressWarnings("unchecked")
    public <T extends Entity> T get(Long id, Boolean fromCache) {
        if (id == null || id <= 0) {
            return null;
        }

        String sql = "SELECT * FROM " + rawTableName() + " WHERE id = ?";
        if (!fromCache) {
            return (T) DbQuery.get(databaseName()).read(getClass(), sql, id);
        }
        Cache cache = getClass().getAnnotation(Cache.class);
        return (cache != null) ?
                (T) DbQuery.get(databaseName()).read_cache(getClass(), cache.cacheNull(), cache.region(), String.valueOf(id), sql, id) :
                (T) DbQuery.get(databaseName()).read(getClass(), sql, id);
    }

    /**
     * 根据主键读取对象详细资料，根据预设方法自动判别是否需要缓存
     *
     * @param id
     * @return
     */
    @SuppressWarnings("unchecked")
    public <T extends Entity> T get(Long id) {
        if (id == null || id <= 0) {
            return null;
        }

        String sql = "SELECT * FROM " + rawTableName() + " WHERE id = ?";
        Cache cache = getClass().getAnnotation(Cache.class);
        return (cache != null) ?
                (T) DbQuery.get(databaseName()).read_cache(getClass(), cache.cacheNull(), cache.region(), String.valueOf(id), sql, id) :
                (T) DbQuery.get(databaseName()).read(getClass(), sql, id);
    }

    /**
     * 根据主键读取对象详细资料，可以排除某些字段，不缓存
     *
     * @param id
     * @return
     */
    @SuppressWarnings("unchecked")
    public <T extends Entity> T get(int id, String[] exclusiveFields) {
        if (id <= 0) {
            return null;
        }
        Map<String, Object> pojo_bean = this.listInsertableFields();
        pojo_bean.put("id", getId());
        StringBuilder sql = new StringBuilder("SELECT ");
        int i = 0;
        for (String field : pojo_bean.keySet()) {
            if (ArrayUtils.contains(exclusiveFields, field)) {
                continue;
            }
            if (i > 0) {
                sql.append(',');
            }
            sql.append("\"");
            sql.append(field);
            sql.append("\"");
            i++;
        }
        sql.append(" FROM ");
        sql.append(rawTableName());
        sql.append(" WHERE id = ?");
        return (T) DbQuery.get(databaseName()).read(getClass(), sql.toString(), id);
    }

    public List<? extends Entity> get(List<Long> ids) {
        if (ids.isEmpty()) {
            return null;
        }
        StringBuilder sql = new StringBuilder("SELECT * FROM " + rawTableName() + " WHERE id IN (");
        for (int i = 1; i <= ids.size(); i++) {
            sql.append('?');
            if (i < ids.size()) {
                sql.append(',');
            }
        }
        sql.append(')');
        List<? extends Entity> beans = DbQuery.get(databaseName()).query(getClass(), sql.toString(), ids.toArray(new Object[ids.size()]));
        if (cachedByID()) {
            for (Object bean : beans) {
                CacheMgr.set(cacheRegion(), String.valueOf(((Entity) bean).getId()), bean);
            }
        }
        return beans;
    }

    /**
     * 统计此对象的总记录数
     *
     * @return
     */
    public int totalCount() {
        if (this.cachedByID()) {
            return DbQuery.get(databaseName()).stat_cache(cacheRegion(), OBJ_COUNT_CACHE_KEY, "SELECT COUNT(*) FROM " + rawTableName());
        }

        return DbQuery.get(databaseName()).stat("SELECT COUNT(*) FROM " + rawTableName());
    }


    /**
     * 批量加载项目
     *
     * @param p_pids
     * @return
     */
    @SuppressWarnings({"rawtypes"})
    public List loadList(List<? extends Number> p_pids) {
        if (CollectionUtil.isEmpty(p_pids)) {
            return new ArrayList();
        }
        List<Long> pids_l = p_pids.stream().map(Number::longValue).collect(Collectors.toList());
        List<Long> pids = new LinkedList<>();
        pids.addAll(pids_l);

        List<Entity> prjs = new ArrayList<Entity>(pids.size()) {
            {
                for (int i = 0; i < pids.size(); i++) {
                    add(null);
                }
            }
        };
        List<Long> no_cache_ids = new ArrayList<>();

        if (!this.cachedByID()) {
            no_cache_ids.addAll(pids_l);
        } else {
            String cache = this.cacheRegion();
            for (int i = 0; i < pids.size(); i++) {
                long pid = pids.get(i);
                Entity obj = (Entity) CacheMgr.get(cache, String.valueOf(pid));

                if (obj != null) {
                    prjs.set(i, obj);
                } else {
                    no_cache_ids.add(pid);
                }
            }
        }

        if (no_cache_ids.isEmpty()) {
            return prjs;
        }

        List<? extends Entity> no_cache_prjs = get(no_cache_ids);
        if (!no_cache_ids.isEmpty()) {
            no_cache_prjs.stream().forEach(s -> {
                prjs.set(pids.indexOf(s.getId()), s);
            });
        }

        return prjs;
    }

    /**
     * 更新某个字段值
     *
     * @param field
     * @param value
     * @return
     */
    public boolean updateField(String field, Object value) {
        String sql = "UPDATE " + rawTableName() + " SET " + field + " = ? WHERE id=?";
        return evict(DbQuery.get(databaseName()).update(sql, value, getId()) == 1);
    }

    /**
     * 更新多个字段值
     *
     * @param map
     * @return
     */
    public boolean updateFields(Map<String, Object> map) {
        if (map != null) {
            Object id = map.remove("id");
            Object[] params = new Object[map.keySet().size()];
            StringBuilder sql = new StringBuilder("update ").append(tableName()).append(" set ");
            int index = 0;
            for (String key : map.keySet()) {
                sql.append("`" + key + "`").append("=?,");
                params[index] = map.get(key);
                index++;
            }
            sql.replace(sql.length() - 1, sql.length(), " where id=");
            sql.append(getId());
            return evict(DbQuery.get(databaseName()).update(sql.toString(), params) == 1);
        }
        return false;
    }

    /**
     * 执行 INSERT ... ON DUPLICATE KEY UPDATE 并返回 LAST_INSERT_ID
     *
     * @param sql
     * @param params
     * @return
     */
    public int executeInsertOrUpdateSQLAndReturnId(String sql, Object... params) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = DbQuery.get(databaseName()).conn().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            for (int i = 0; i < params.length; i++) {
                ps.setObject(i + 1, params[i]);
            }
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            return rs.next() ? rs.getInt(1) : -1;
        } catch (SQLException e) {
            throw new DBException(e);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
        }
    }

    /**
     * 插入对象
     *
     * @param obj
     * @return 返回插入对象的主键
     */
    private long _InsertObject(Entity obj) {
        Map<String, Object> pojo_bean = obj.listInsertableFields();
        if (this.getId() != null && this.getId() > 0) {
            pojo_bean.put("id", this.getId());
        }
        String[] fields = pojo_bean.keySet().stream().toArray(String[]::new);
        StringBuilder sql = new StringBuilder("INSERT INTO ");
        sql.append(obj.rawTableName());
        //双引号导致  形如 INSERT INTO osc_blogs("origin_url","abstracts","catalog","project", 语法异常，此处修改剔除双引号
        //修改为反单引号
        //sql.append("(\"");
        sql.append("(`");
        for (int i = 0; i < fields.length; i++) {
            if (i > 0) {
                sql.append("`,`");
            }
            sql.append(StrUtil.toUnderlineCase(fields[i]));
        }
        //sql.append("\") VALUES(");
        sql.append("`) VALUES(");
        for (int i = 0; i < fields.length; i++) {
            if (i > 0) {
                sql.append(',');
            }
            sql.append('?');
        }
        sql.append(')');
        try (PreparedStatement ps = DbQuery.get(databaseName()).conn().prepareStatement(sql.toString(),
                PreparedStatement.RETURN_GENERATED_KEYS)) {
            for (int i = 0; i < fields.length; i++) {
                ps.setObject(i + 1, pojo_bean.get(fields[i]));
            }

            ps.executeUpdate();
            if (getId() != null && getId() > 0) {
                return getId();
            }

            try (ResultSet rs = ps.getGeneratedKeys()) {
                return rs.next() ? rs.getInt(1) : -1;
            }
        } catch (SQLException e) {
            throw new DBException(e);
        }
    }

    /**
     * 列出要插入到数据库的字段集合，子类可以覆盖此方法
     *
     * @return
     */
    protected Map<String, Object> listInsertableFields() {
        Map<String, Object> props = new HashMap<>();
        try {
            PropertyDescriptor[] fields = Introspector.getBeanInfo(getClass()).getPropertyDescriptors();
            Field[] declaredFields = this.getClass().getDeclaredFields();
            Map<String, Boolean> fieldMap = new HashMap<>();
            for (Field field : declaredFields) {
                TableField annotation = field.getAnnotation(TableField.class);
                if (annotation == null) {
                    continue;
                }
                boolean exist = annotation.exist();
                if (!exist) {
                    fieldMap.put(field.getName().toLowerCase(), !exist);
                }
            }
            for (PropertyDescriptor field : fields) {
                if ("class".equals(field.getName())) {
                    continue;
                }
                if (getId() != null && getId() == 0 && "id".equals(field.getName())) {
                    continue;
                }
                Boolean aBoolean = fieldMap.get(field.getName().toLowerCase());
                if (aBoolean != null && aBoolean) {
                    continue;
                }
                Object fv = field.getReadMethod().invoke(this);
                if (fv == null /*|| ((fv instanceof Number) && ((Number) fv).intValue() == 0)*/) {
                    continue;
                }
                props.put(field.getName(), fv);
            }

            return props;

        } catch (IntrospectionException | IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException("ListInsertableFields Failed", e);
        }
    }

    public long user() {
        try {
            PropertyDescriptor[] fields = Introspector.getBeanInfo(getClass()).getPropertyDescriptors();
            for (PropertyDescriptor field : fields) {
                if ("user".equalsIgnoreCase(field.getName())) {
                    Object fv = field.getReadMethod().invoke(this);
                    return ((long) fv);
                }
            }
        } catch (Exception e) {
        }
        return 0L;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        // 不同的子类尽管ID是相同也是不相等的
        if (!getClass().equals(obj.getClass())) {
            return false;
        }
        Entity wb = (Entity) obj;
        return wb.getId() == getId();
    }

    /**
     * 返回对象对应的缓存区域名
     *
     * @return
     */
    public String cacheRegion() {
        Cache cache = this.getClass().getAnnotation(Cache.class);
        return (cache != null) ? cache.region() : null;
    }

    /**
     * 是否根据ID缓存对象，此方法对Get(long id)有效
     *
     * @return
     */
    private boolean cachedByID() {
        Cache cache = this.getClass().getAnnotation(Cache.class);
        return cache != null;
    }

    private boolean cacheNullObject() {
        Cache cache = this.getClass().getAnnotation(Cache.class);
        return cache != null && cache.cacheNull();
    }

    /**
     * 更新对象
     *
     * @return
     */
    public boolean doUpdate() {
        return doUpdate(true);
    }

    /**
     * 更新对象
     *
     * @return
     */
    public boolean doUpdate(boolean evict) {
        Map<String, Object> map = listInsertableFields();
        Object id = map.remove("id");
        Set<Map.Entry<String, Object>> entrys = map.entrySet();
        Object[] params = new Object[entrys.size()];
        StringBuilder sql = new StringBuilder("update ").append(tableName()).append(" set ");
        int index = 0;
        for (Map.Entry<String, Object> entry : entrys) {
            sql.append("`" + StrUtil.toUnderlineCase(entry.getKey()) + "`").append("=?,");
            params[index] = entry.getValue();
            index++;
        }
        sql.replace(sql.length() - 1, sql.length(), " where id=");
        sql.append(id);
        if (evict) {
            CacheMgr.evict(this.CacheRegion(), String.valueOf(this.getId()));
        }
        return DbQuery.get(databaseName()).update(sql.toString(), params) > 0;
    }


    public List<? extends Entity> filter(String filter, int page, int size, Object... params) {
        String sql = "SELECT * FROM " + tableName();
        if (StringUtils.isNotBlank(filter)) {
            if (filter.toLowerCase().contains("where")) {
                sql += filter;
            } else {
                sql += " WHERE " + filter;
            }
        }
        if (StringUtils.isNotBlank(filter) && !filter.toLowerCase().contains("order by")) {
            sql += " order by id desc";
        }
        return DbQuery.get(databaseName()).query_slice(getClass(), sql, page, size, params);
    }

    /**
     * 根据条件获取id，再根据id获取该对象
     *
     * @param t
     * @param sql
     * @param params
     * @param <T>
     * @return
     */
    public <T extends Entity> T getById(T t, String sql, Object... params) {
        if (StringUtils.isBlank(sql)) {
            return null;
        }
        Number n = DbQuery.get(databaseName()).read(Number.class, sql, params);
        if (n == null || n.longValue() <= 0L) {
            return null;
        }
        return t.get(n.longValue());
    }

    /**
     * 根据条件获取id集合，再获取对象
     *
     * @param t
     * @param sql
     * @param params
     * @param <T>
     * @return
     */
    public <T extends Entity> List<T> sliceByIds(T t, String sql, int page, int size, Object... params) {
        if (StringUtils.isBlank(sql)) {
            return null;
        }
        List<Number> numbers = DbQuery.get(databaseName()).query_slice(Number.class, sql, page, size, params);
        if (numbers.isEmpty()) {
            return null;
        }
        List<Long> ids = numbers.stream().map(Number::longValue).collect(Collectors.toList());
        return t.loadList(ids);
    }

    /**
     * 根据条件获取id
     *
     * @param t
     * @param sql
     * @param params
     * @param <T>
     * @return
     */
    public <T extends Entity> Number getId(T t, String sql, Object... params) {
        if (StringUtils.isBlank(sql)) {
            return null;
        }
        return DbQuery.get(databaseName()).read(Number.class, sql, params);
    }

}
