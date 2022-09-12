package com.oscer.hongxing.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * https://maplemei.gitee.io/xm-select/#/plugin/tree
 * xm-select的数据类型
 * @author kz
 * @since 2022-09-08 14:36:09
 */
@NoArgsConstructor
@Data
public class CategoryXmVO {

    private String name;
    private long value;
    private boolean disabled;
    private List<ChildrenBean> children;

    @NoArgsConstructor
    @Data
    public static class ChildrenBean {
        private String name;
        private long value;
        private boolean selected;
        private boolean disabled;
    }
}
