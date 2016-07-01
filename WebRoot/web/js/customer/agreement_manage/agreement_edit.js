/**
 * Created by qulongjun on 16/3/2.
 * 合同起草
 */

//增加检查项目
$('#add_item').on('click', function () {
    var environment_element_result = $('#agreement_tpl_container').find('select[name=environment_element]').val();//环境要素value值
    var environment_element_value = $('#agreement_tpl_container').find('select[name=environment_element] option:selected').text();//环境要素text值
    var monitor_item_result = $('#agreement_tpl_container').find('select[name=monitor_item]').val();//监测项目value值
    var monitor_item_value = $('#agreement_tpl_container').find('select[name=monitor_item] option:selected').text();//监测项目text值
    var monitor_rate_result = $('#agreement_tpl_container').find('select[name=monitor_rate]').val();//监测频次value值
    var monitor_rate_value = $('#agreement_tpl_container').find('select[name=monitor_rate] option:selected').text();//监测频次text值
    var monitor_point = $('#agreement_tpl_container').find('input[name=monitor_point]').val();//监测点
    var project_item_other = $('#agreement_tpl_container').find('input[name=project_item_other]').val();//备注
    var code = '<tr class="item_tag">'
        + '<td width="88" valign="middle" align="center" style="border-width: 1px; border-style: solid;">'
        + '<input name="environment_element" disabled type="text" class="form-control" value="' + environment_element_value + '" data-value="' + environment_element_result + '" >'
        + '</td>'
        + '<td width="101" valign="middle" align="center" style="border-width: 1px; border-style: solid;">'
        + '<input name="monitor_point" type="text" class="form-control" title="monitor_point" value="' + monitor_point + '" data-value="' + monitor_point + '">'
        + '</td>'
        + '<td width="92" valign="middle" align="center" style="border-width: 1px; border-style: solid;">'
        + '<input name="monitor_item" type="text" disabled class="form-control" data-value="' + monitor_item_result + '" value="' + monitor_item_value + '">'
        + '</td>'
        + '<td width="71" valign="middle" align="center" style="border-width: 1px; border-style: solid;">'
        + '<input name="monitor_rate" type="text" disabled class="form-control" value="' + monitor_rate_value + '" data-value="' + monitor_rate_result + '">'
        + '</td>'
        + '<td width="88" valign="middle" align="center" style="border-width: 1px; border-style: solid;">'
        + '<input name="project_item_other" type="text" class="form-control" value="' + project_item_other + '" data-value="' + project_item_other + '">'
        + '</td>'
        + '</tr>';
    $(this).parents('tr').before(code);
    $('#item_title').attr('rowspan', parseInt($('#item_title').attr('rowspan')) + 1);
});
//删除检查项目
$('#del_item').on('click', function () {
    if ($('.item_tag').length == 1) {
        return false;
    }
    $(this).parents('tr').prev().remove();
    $('#item_title').attr('rowspan', parseInt($('#item_title').attr('rowspan')) - 1);
});
//金额小写转大写
$('#agreement_tpl_container').find('input[name=project_money]').on('input propertychange', function () {
    var chinese = atoc($(this).val());
    $('#chinese_pay').html(chinese);
});
//检测方法中如果用户选择了自己定义方法,则显示文本框,否则就禁用掉
$('#agreement_tpl_container').find('input[name=monitor_way]').on('click', function () {
    var result = $(this).data('type');
    result == 1 ? $('#agreement_tpl_container').find('input[name=monitor_customer_way]').prop('disabled', false) : $('#agreement_tpl_container').find('input[name=monitor_customer_way]').prop('disabled', true);
});
$("#agreement_select").select2();
$("#environment_element").select2();
$("#monitor_item").select2();
$("#monitor_rate").select2();