/******************************************************************************
* filename: product_edit.js
* 列表项顺序调整工具脚本
* (C) Oran Day(oransite#gmail.com), MasterLi(masterljf#hotmail.com)
* (C) NSW(http://www.nsw.com)
*******************************************************************************/
function adjustUp() {
    var itemOptions = document.forms[0].PickList.options;
    var selectedOption;
    var count = 0;
    var index;
    for (i = 0; i < itemOptions.length; i++) {
        var temp = itemOptions.item(i);
        if (temp.selected == true) {
            count++;
            if (count > 1) {
                alert("只能选择一个列调整顺序！");
                return;
            } else if (count == 1) {
                index = i;
            }
        }
    }
    if (count == 0) {
        alert("请选择要调整顺序的列！");
        return;
    }

    if (index == 0)
        return;

    selectedOption = itemOptions[index];
    var lastOption = itemOptions[index - 1];
    var temp = new Option(selectedOption.text, selectedOption.value);

    selectedOption.text = lastOption.text;
    selectedOption.value = lastOption.value;
    selectedOption.selected = false;

    lastOption.text = temp.text;
    lastOption.value = temp.value;
    lastOption.selected = true;
}

function adjustDown() {
    var itemOptions = document.forms[0].PickList.options;
    var selectedOption;
    var count = 0;
    var index;
    for (i = 0; i < itemOptions.length; i++) {
        var temp = itemOptions[i];
        if (temp.selected == true) {
            count++;
            if (count > 1) {
                alert("只能选择一个列调整顺序！");
                return;
            } else if (count == 1) {
                index = i;
            }
        }
    }

    if (count == 0) {
        alert("请选择要调整顺序的列！");
        return;
    }

    if (index == itemOptions.length - 1)
        return;
    selectedOption = itemOptions[index];
    var nextOption = itemOptions[index + 1];
    var temp = new Option(selectedOption.text, selectedOption.value);

    selectedOption.text = nextOption.text;
    selectedOption.value = nextOption.value;
    selectedOption.selected = false;

    nextOption.text = temp.text;
    nextOption.value = temp.value;
    nextOption.selected = true;
}

function selCheckIt() {
    var pickList = document.getElementById("PickList");
    var pickOptions = pickList.options;
    var pickOLength = pickOptions.length;
    if (pickOLength < 1) {
        if (confirm("该产品分类还没有设置产品属性，是否不用设置产品属性直接保存产品分类？确定：直接保存产品分类，取消：马上设置产品分类属性")) {
            return true;
        }
        else {
            pickList.focus();
            return false;
        }
    }
    else {
        return true;
    }
}