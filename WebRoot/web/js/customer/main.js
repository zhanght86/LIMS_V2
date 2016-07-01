/**
 * 全局变量
 */
var mytheme = 'flat';//可选格式:flat/future/block/air/ice
var mypos = 'messenger-on-top';//可选messenger-on-top messenger-on-left/messenger-on-top/messenger-on-top messenger-on-right/messenger-on-bottom messenger-on-left/messenger-on-bottom/messenger-on-bottom messenger-on-right
Messenger.options = {
    extraClasses: 'messenger-fixed ' + mypos,
    theme: mytheme
};
var me = $(window.frames['rightFrame'].document.body);
window.me = me;
/**
 * askMessage:弹出一个询问框,有两个按钮,第一个按钮为ok,第二个按钮为取消
 * @param title 询问框的消息内容
 * @param messageBtn ok按钮的按钮内容
 * @param successinfo 执行成功的提示文字
 * @param succfunc 点击ok按钮执行的方法
 * @param cancelfun 点击cancel按钮执行的方法
 */
var askMessage = function (title, messageBtn, successinfo, succfunc, cancelfun) {
    var msg;
    msg = Messenger().post({
        message: title,
        type: 'info',
        actions: {
            ok: {
                label: messageBtn,
                action: function () {
                    if (succfunc) succfunc();
                    return msg.update({
                        message: successinfo,
                        type: 'success',
                        showCloseButton: true,
                        actions: false
                    });
                }
            },
            cancel: {
                label: '取消',
                action: function () {
                    if (cancelfun) cancelfun();
                    msg.cancel();
                }
            }
        }
    });
};
var alertMessage = function (title, type) {
    var msg;
    msg = Messenger().post({
        message: title,
        type: type,
        showCloseButton: true
    });
};
/**
 * 首页
 */
me.find('#signBoard').on('click', function () {
    askMessage('今天是2016年2月28日,是否进行签到?', '签到', '签到成功!');
});
/**
 * 个人中心->发布公告
 */
me.find('#formWizard .submitBtn').on('click', function () {
    alertMessage('公告发布成功!', 'success');
}).hide();

/**
 * 知识中心->公共知识库
 */
me.find('#collectAllFile').on('click', function () {
    askMessage('是否将选中文件收藏至私有云?', '收藏', '收藏成功!');
});

me.find('#downloadAllFile').on('click', function () {
    askMessage('是否将选中文件下载至本地?', '下载', '下载成功!');
});
me.find('#delAllFile').on('click', function () {
    askMessage('是否删除选中文件?', '删除', '删除成功!');
});
me.find('.collectFile').on('click', function () {
    askMessage('是否将文件MyDocument.doc收藏至私有云?', '收藏', '收藏成功!');
});

me.find('.downloadFile').on('click', function () {
    askMessage('是否将文件MyDocument.doc下载至本地?', '下载', '下载成功!');
});
me.find('.editFile').on('click', function () {
    bootbox.confirm({
        message: '<div class="row">'
        + '<form class="form-horizontal" role="form">'
        + '<div class="form-group">'
        + '<label class="col-sm-2 control-label">文件名</label>'
        + '<div class="col-sm-8">'
        + '<input type="text" class="form-control" placeholder="新的文件名">'
        + '</div>'
        + '</div>'
        + '<div class="form-group">'
        + '<label class="col-sm-2 control-label">文件夹</label>'
        + '<div class="col-sm-8">'
        + '<select class="form-control">'
        + '<option>分类1</option>'
        + '<option>分类2</option>'
        + '<option>分类3</option>'
        + '<option>分类4</option>'
        + '<option>分类5</option>'
        + '</select>'
        + '</div>'
        + '</div>'
        + '</form></div>',
        buttons: {
            confirm: {
                label: '保存',
                className: 'btn-myStyle'
            },
            cancel: {
                label: '取消',
                className: 'btn-default'
            }
        },
        callback: function (result) {
            if (result) {
                alertMessage('保存成功!', 'success');

            }
        },
        title: '文件修改'
    });

});
me.find('#addFolder').on('click', function () {
    bootbox.confirm({
        message: '<div class="row">'
        + '<form class="form-horizontal" role="form">'
        + '<div class="form-group">'
        + '<label class="col-sm-2 control-label">文件夹名</label>'
        + '<div class="col-sm-8">'
        + '<input type="text" class="form-control" placeholder="新的文件夹名">'
        + '</div>'
        + '</div>'
        + '</form></div>',
        buttons: {
            confirm: {
                label: '创建',
                className: 'btn-myStyle'
            },
            cancel: {
                label: '取消',
                className: 'btn-default'
            }
        },
        callback: function (result) {
            if (result) {
                alertMessage('创建成功!', 'success');

            }
        },
        title: '创建文件夹'
    });
});
me.find('.editFolder').on('click', function () {
    bootbox.confirm({
        message: '<div class="row">'
        + '<form class="form-horizontal" role="form">'
        + '<div class="form-group">'
        + '<label class="col-sm-2 control-label">文件夹名</label>'
        + '<div class="col-sm-8">'
        + '<input type="text" class="form-control" placeholder="新的文件夹名">'
        + '</div>'
        + '</div>'
        + '</form></div>',
        buttons: {
            confirm: {
                label: '修改',
                className: 'btn-myStyle'
            },
            cancel: {
                label: '取消',
                className: 'btn-default'
            }
        },
        callback: function (result) {
            if (result) {
                alertMessage('修改成功!', 'success');

            }
        },
        title: '修改文件夹'
    });

});
me.find('.delFolder').on('click', function () {
    askMessage('是否删除文件夹"专业资料" ? 该文件夹下所有文件将移动到"未分组"文件夹下 !', '删除', '删除成功!');
});
me.find('.delFile').on('click', function () {
    askMessage('是否删除文件MyDocument.doc?', '删除', '删除成功!');
});

me.find('#uploadFile').on('click', function () {
    bootbox.alert({
        message: '<div class="row">'
        + '<div class="col-md-12">'
        + '<div class="box border blue">'
        + '<div class="box-title">'
        + '<h4><i class="fa fa-cloud-download"></i>文件上传</h4>'
        + '</div>'
        + '<div class="box-body">'
        + '<form action="//file-arrow-circle-o-up"class="dropzone"id="my-awesome-dropzone">'
        + '<div class="fallback">'
        + '<input name="file" type="file" multiple="" />'
        + '</div>'
        + '</form>'
        + '</div>'
        + '</div>'
        + '</div>'
        + '</div>',
        buttons: {
            ok: {
                label: '完成',
                className: 'btn-myStyle'
            }
        },
    });
    try {
        $(".dropzone").dropzone({
            paramName: "file", // The name that will be used to transfer the file
            maxFilesize: 0.5, // MB

            addRemoveLinks: true,
            dictResponseError: '文件上传失败!',

            //change the previewTemplate to use Bootstrap progress bars
            previewTemplate: "<div class=\"dz-preview dz-file-preview\">\n  <div class=\"dz-details\">\n    <div class=\"dz-filename\"><span data-dz-name></span></div>\n    <div class=\"dz-size\" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class=\"progress progress-sm progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  <div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n  <div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>"
        });
    } catch (e) {
        alert('当前浏览器不支持拖拽上传,请更新浏览器!');
    }
});
/**
 * 合同范本
 */
me.find('#save_model').on('click', function () {
    askMessage('是否保存当前合同范本?', '保存', '保存成功!');
});
me.find('#del_model').on('click', function () {
    askMessage('是否删除合同范本《2016标准版公司房屋租赁合同书范本》?', '删除', '删除成功!');
});
/**
 * 部门管理
 */
me.find('#del_department').on('click', function () {
    askMessage('是否删除部门"质量控制室"?该部门下用户组和用户将会被删除。', '删除', '删除成功!');
});
me.find('.del_user_group').on('click', function () {
    askMessage('是否删除用户组"客服组"?该用户组下的用户将会被删除。', '删除', '删除成功!');
});
me.find('.stop_user_group').on('click', function () {
    askMessage('是否停用用户组"客服组"?该用户组下的用户将会被停用。', '停用', '停用成功!');
});
me.find('.start_user_group').on('click', function () {
    askMessage('是否启用用户组"客服组"?该用户组下的用户将会被启用。', '启用', '启用成功!');
});
me.find('#change_department,#create_department').on('click', function () {
    bootbox.dialog({
        message: '<form class="form-horizontal" role="form">'
        + '<div class="form-group">'
        + '<label class="col-sm-3 control-label">部门名称</label>'
        + '<div class="col-sm-9">'
        + '<input type="text" class="form-control" placeholder="请输入部门名称">'
        + '</div>'
        + '</div>'
        + '<div class="form-group">'
        + '<label class="col-sm-3 control-label">备注信息</label>'
        + '<div class="col-sm-9">'
        + '<textarea class="form-control" rows="3" placeholder="请输入备注信息"></textarea>'
        + '</div>'
        + '</div>'
        + '</form>',
        buttons: {
            ok: {
                label: '完成',
                className: 'btn-info'
            },
            cancel: {
                label: '取消',
                className: 'btn-default'
            },
        },
        callback: function (result) {
            alert(result);
        },
        closeButton: false
    });
});
me.find('.edit_user_group,#create_user_group').on('click', function () {
    bootbox.dialog({
        message: '<form class="form-horizontal" role="form">'
        + '<div class="form-group">'
        + '<label class="col-sm-3 control-label">用户组名称</label>'
        + '<div class="col-sm-9">'
        + '<input type="text" class="form-control" placeholder="请输入用户组名称">'
        + '</div>'
        + '</div>'
        + '<div class="form-group">'
        + '<label class="col-sm-3 control-label">备注信息</label>'
        + '<div class="col-sm-9">'
        + '<textarea class="form-control" rows="3" placeholder="请输入备注信息"></textarea>'
        + '</div>'
        + '</div>'
        + '</form>',
        buttons: {
            ok: {
                label: '完成',
                className: 'btn-info'
            },
            cancel: {
                label: '取消',
                className: 'btn-default'
            },
        },
        callback: function (result) {
            alert(result);
        },
        closeButton: false
    })
    ;
});
/**
 * 权限管理
 */
me.find('#del_all_authority').on('click', function () {
    askMessage('是否清空所有选中用户组的权限?清空用户组权限会导致用户无权访问平台。', '清空', '清空成功!');
});
me.find('#finish_authority').on('click', function () {
    askMessage('是否将权限策略应用至所有选中用户组?选中用户组下的用户将在下次进入平台之后生效权限。', '设置', '设置成功!');
});
me.find('.finish_authority_item').on('click', function () {
    askMessage('是否将权限策略应用至用户组"管理员组"?该用户组下的用户将在下次进入平台之后生效权限。', '设置', '设置成功!');
});
/**
 * 用户管理
 */
me.find('.reset_user_password').on('click', function () {
    askMessage('是否将编号为"A0001"的用户的平台登录密码设置为初始密码?设置之后原登录密码将失效。', '重置', '重置成功!');
});
me.find('.start_user').on('click', function () {
    askMessage('是否启用编号为"A0001"的用户?', '启用', '启用成功!');
});
me.find('.stop_user').on('click', function () {
    askMessage('是否停用编号为"A0001"的用户?该用户下的任务将自动回滚至上一次任务进度。', '停用', '停用成功!');
});
me.find('.del_user').on('click', function () {
    askMessage('是否删除编号为"A0001"的用户?该用户下的任务将自动回滚至上一次任务进度。', '删除', '删除成功!');
});
me.find('#reset_user_password_checked').on('click', function () {
    askMessage('是否将有选中用户的平台登录密码重置为初始密码?设置之后原登录密码将失效。', '重置', '重置成功!');
});
me.find('#start_user_password_checked').on('click', function () {
    askMessage('是否启用所有选中用户的账号?', '启用', '启用成功!');
});
me.find('#stop_user_password_checked').on('click', function () {
    askMessage('是否停用所有选中用户的账号?用户下的任务将自动回滚至上一次任务进度。', '停用', '停用成功!');
});
me.find('#del_user_password_checked').on('click', function () {
    askMessage('是否删除所有选中用户的账号?用户下的任务将自动回滚至上一次任务进度。', '删除', '删除成功!');
});
/**
 * 起草合同
 */
me.find('#agreement_create .submitBtn').on('click', function () {
    askMessage('请确认合同相关信息,是否生成该合同?', '生成', '生成成功!');
});
/**
 * 合同审核
 */
me.find('#agreement_audit_approve').on('click', function () {
    askMessage('是否通过项目名为"关于四号桥河流水质监测项目"的合同审核?', '通过', '通过成功!');
});
me.find('#agreement_audit_reject').on('click', function () {
    askMessage('是否拒绝项目名为"关于四号桥河流水质监测项目"的合同审核?', '拒绝', '拒绝成功!');
});
me.find('#download_agreement_audit').on('click', function () {
    askMessage('是否将项目名为"关于四号桥河流水质监测项目"的合同评审意见表导出?', '导出', '导出成功!');
});
me.find('#print_agreement_audit').on('click', function () {
    askMessage('是否直接打印项目名为"关于四号桥河流水质监测项目"的合同评审意见表?', '打印', '打印成功!');
});
/**
 * 合同管理
 */
me.find('#export_agreement_list').on('click', function () {
    askMessage('是否将选中的合同生成业务登记表?', '生成', '生成成功!');
});
me.find('#download_agreement_checked').on('click', function () {
    askMessage('是否将选中的合同批量下载至本地?', '下载', '下载成功!');
});
me.find('#stop_agreement_checked').on('click', function () {
    askMessage('是否批量中止选中的业务合同,中止合同会导致流程提前结束。', '中止', '中止成功!');
});
me.find('.download_agreement').on('click', function () {
    askMessage('是否下载项目名为"关于四号桥河流水质监测项目"的合同到本地?', '下载', '下载成功!');
});
me.find('.view_agreement').on('click', function () {
    askMessage('是否查看项目名为"关于四号桥河流水质监测项目"的合同?', '查看', '查看成功!');
});
me.find('.stop_agreement').on('click', function () {
    askMessage('是否中止项目名为"关于四号桥河流水质监测项目"的合同,中止合同会导致流程提前结束。', '中止', '中止成功!');
});
me.find('.edit_agreement').on('click', function () {
    askMessage('是否进入项目名为"关于四号桥河流水质监测项目"的合同变更界面?', '进入', '进入成功!');
});
/**
 * 合同变更
 */
me.find('#agreement_editor_form .submitBtn').on('click', function () {
    askMessage('请确认合同相关变更信息,是否变更该合同?', '变更', '变更成功!');
});
me.find('#download_agreement_edit').on('click', function () {
    askMessage('是否导出当前变更记录的合同变更申请书?', '导出', '导出成功!');
});
me.find('.view_agreement_edit_history').on('click', function () {
    askMessage('查看合同变更申请书?', '查看', '查看成功!');
});
me.find('.download_agreement_edit_history').on('click', function () {
    askMessage('是否导出当前选中变更记录的合同变更申请书?', '导出', '导出成功!');
});
/**
 * 样品登记
 */
me.find('#create_sample_item').on('click', function () {
    //创建新的样品登记
});
me.find('#print_sample_checked').on('click', function () {
    askMessage('是否批量打印所有选中样品的二维码标签?', '打印', '打印成功!');
});
me.find('#del_sample_checked').on('click', function () {
    askMessage('是否删除当前所有选中的样品信息?', '删除', '删除成功!');
});
me.find('.del_sample_item').on('click', function () {
    askMessage('是否删除编号为A00001的样品信息?', '删除', '删除成功!');
});
me.find('.print_sample_item').on('click', function () {
    askMessage('打印二维码?', '打印', '打印成功!');
});
me.find('.edit_sample_item').on('click', function () {
    bootbox.dialog({
        message: '<form class="form-horizontal" role="form">'
        + '<div class="form-group">'
        + '<label class="col-sm-3 control-label">样品名称</label>'
        + '<div class="col-sm-9">'
        + '<input type="text" class="form-control" placeholder="请输入部门名称">'
        + '</div>'
        + '</div>'
        + '<div class="form-group">'
        + '<label class="col-sm-3 control-label">检测类别</label>'
        + '<div class="col-sm-9">'
        + '<select class="form-control">'
        + '<option>1</option>'
        + '<option>2</option>'
        + '<option>3</option>'
        + '<option>4</option>'
        + '<option>5</option>'
        + '</select>'
        + '</div>'
        + '</div>'
        + '<div class="form-group">'
        + '<label class="col-sm-3 control-label">检测项目</label>'
        + '<div class="col-sm-9">'
        + '<select multiple id="choose_monitor_item" class="col-md-12">'
        + '<option></option>'
        + '<option>Alabama</option>'
        + '<option>Alaska</option>'
        + '<option>Arizona</option>'
        + '<option>Arkansas</option>'
        + '</select>'
        + '</div>'
        + '</div>'
        + '<div class="form-group">'
        + '<label class="col-sm-3 control-label">备注</label>'
        + '<div class="col-sm-9">'
        + '<textarea class="form-control" rows="3" placeholder="请输入备注信息"></textarea>'
        + '</div>'
        + '</div>'
        + '</form>',
        buttons: {
            ok: {
                label: '完成',
                className: 'btn-info'
            },
            cancel: {
                label: '取消',
                className: 'btn-default'
            },
        },
        callback: function (result) {
            alert(result);
        },
        closeButton: false
    });
    $("#choose_monitor_item").select2({
        placeholder: "请选择检测项目",
        allowClear: true
    });
});
me.find('#download_sample_list').on('click',function(){
    askMessage('是否导出项目名为"关于六号桥水质检测项目"的样品登记表?', '导出', '导出成功!');
});

me.find('#receive_sample_checked').on('click',function(){
    askMessage('是否批量接收当前所有选中的样品信息?', '接收', '接收成功!');
});
me.find('.receive_sample_item').on('click',function(){
    askMessage('是否接收样品编号为A0001的样品?', '接收', '接收成功!');
});