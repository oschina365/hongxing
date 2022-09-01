/*
 * Copyright (c) 2011-2020, baomidou (jobob@qq.com).
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * https://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package com.oscer.hongxing.bean;
import ch.qos.logback.classic.db.names.TableName;

import java.lang.annotation.*;

/**
 * 表字段标识
 *
 * @author hubin sjy tantan
 * @since 2016-09-09
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD, ElementType.ANNOTATION_TYPE})
public @interface TableField {

    /**
     * 数据库字段值
     * <p>
     * 不需要配置该值的情况:
     * (mp下默认是true,mybatis默认是false), 数据库字段值.replace("_","").toUpperCase() == 实体属性名.toUpperCase() </li>
     * 数据库字段值.toUpperCase() == 实体属性名.toUpperCase() </li>
     */
    String value() default "";

    /**
     * 是否为数据库表字段
     * <p>
     * 默认 true 存在，false 不存在
     */
    boolean exist() default true;

    /**
     * 字段 where 实体查询比较条件
     * <p>
     */
    String condition() default "";

    /**
     * 字段 update set 部分注入, 该注解优于 el 注解使用
     * <p>
     * 例1：@TableField(.. , update="%s+1") 其中 %s 会填充为字段
     * 输出 SQL 为：update 表 set 字段=字段+1 where ...
     * <p>
     * 例2：@TableField(.. , update="now()") 使用数据库时间
     * 输出 SQL 为：update 表 set 字段=now() where ...
     */
    String update() default "";

    /**
     * 指定小数点后保留的位数,
     * 只生效于 mp 自动注入的 method,
     * 建议配合 {@link TableName#autoResultMap()} 一起使用
     * <p>
     * {@link ParameterMapping#numericScale}
     *
     * @since 3.1.2
     */
    String numericScale() default "";
}
