//treeSelect组件
layui.define(['layer', 'ztree','form'], function(exports) {
    var _MOD = 'treeSelect',
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery;
    var TreeSelect = function() {
        this.v = '1.0.0';
    };
    /**
     * 渲染treeSelect
     */
    TreeSelect.prototype.render = function(options) {
        var that = this;
        // 设置可参考ztree.js配置 URL:http://www.treejs.cn/v3/api.php
        var eleId= $(options.elem).attr('id');
        var fakeElement = $(options.elem).clone().attr('id','fake-'+eleId).attr('name','fake-'+eleId);//伪造一个显示元素
        $(options.elem).after(fakeElement);
        $(options.elem).hide();
        form.render();
        var setting = {view: {dblClickExpand: false},data: {simpleData: {enable: true}},
            callback: {
                onClick: function(e, treeId, treeNode){
                    if (typeof(overrideOnClick) == 'undefined' || overrideOnClick === false) {
                        var obj = $(options.elem);
                        obj.attr('value', treeNode.id);
                        var fakeObj = $('#fake-'+eleId);
                        fakeObj.attr('value', treeNode.name);
                        hideMenu();
                    }
                    else if (typeof(overrideOnClick) != 'undefined' && overrideOnClick === true) {
                        var func=eval(element.id+'onClick');
                        var rtn = func(e, treeId, treeNode);
                        if(rtn=== undefined || rtn===true){
                            hideMenu();
                        }
                    }else{
                        alert('no onclick function');
                    }
                },
                beforeClick: function(treeId, treeNode, clickFlag) {

                    if (typeof(overrideBeforeClick) != 'undefined' && overrideBeforeClick === true) {
                        var func=eval(element.id+'beforeClick');
                        var rtn = func(treeId, treeNode, clickFlag);
                        return rtn;
                    }
                }

            }
        };
        //ztree hideMenu
        function hideMenu() {
            $('.ztree-content').fadeOut('fast');
            $('body').unbind('mousedown', onBodyDown);
        }

        $('#fake-'+eleId).on('click',  function() {
            var obj = $(this);
            console.info(this.id);
            console.info(options.elem);
            var ztreeContentId = this.id+'Content';
            var ztreeId = this.id+'Ztree';
            $('#'+ztreeContentId).remove();
            var width = this.clientWidth;
            var ztreeHtml = '<div id="'+ztreeContentId+'" class="ztree-content" style="display:none; position: absolute; border: 1px solid #24AC7E;z-index:20000000; background-color: white">';
            ztreeHtml += '<ul id="'+ztreeId+'" class="ztree" style="margin-top:0; width:'+width+'px;"></ul></div>';
            $('body').append(ztreeHtml);
            $.fn.zTree.init($('#'+ztreeId), setting, options.data);

            var objOffset = obj.offset();
            $('#'+ztreeContentId).css({left:objOffset.left + 'px', top:objOffset.top + obj.outerHeight() + 'px'}).slideDown('fast').show();
            $('body').bind('mousedown', onBodyDown);
        });


        //点击事件的处理
        function onClick(e, treeId, treeNode) {

        }
        function onBodyDown(event) {
            if ($(event.target).parents('.ztree-content').length==0) {
                hideMenu();
            }
        }
        return that;
    };


    // 导出组件
    exports(_MOD, new TreeSelect());
});