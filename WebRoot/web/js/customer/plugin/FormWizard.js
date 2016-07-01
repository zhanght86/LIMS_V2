/**
 * Created by qulongjun on 16/3/2.
 * 表单向导插件
 */
var wizard = function () {
    return {
        init: function (formObj, containerObj) {
            if (!jQuery().bootstrapWizard) {
                return;
            }
            var wizform = formObj;
            var container = containerObj;
            /*-----------------------------------------------------------------------------------*/
            /*	Initialize Bootstrap Wizard
             /*-----------------------------------------------------------------------------------*/
            container.bootstrapWizard({
                'nextSelector': '.nextBtn',
                'previousSelector': '.prevBtn',
                onNext: function (tab, navigation, index) {
                    if (wizform.valid() == false) {
                        return false;
                    }
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    $('.stepHeader', container).text('Step ' + (index + 1) + ' of ' + total);
                    jQuery('li', container).removeClass("done");
                    var li_list = navigation.find('li');
                    for (var i = 0; i < index; i++) {
                        jQuery(li_list[i]).addClass("done");
                    }
                    if (current == 1) {
                        container.find('.prevBtn').hide();
                    } else {
                        container.find('.prevBtn').show();
                    }
                    if (current >= total) {
                        container.find('.nextBtn').hide();
                        container.find('.submitBtn').show();
                    } else {
                        container.find('.nextBtn').show();
                        container.find('.submitBtn').hide();
                    }
                },
                onPrevious: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    $('.stepHeader', container).text('Step ' + (index + 1) + ' of ' + total);
                    jQuery('li', container).removeClass("done");
                    var li_list = navigation.find('li');
                    for (var i = 0; i < index; i++) {
                        jQuery(li_list[i]).addClass("done");
                    }
                    if (current == 1) {
                        container.find('.prevBtn').hide();
                    } else {
                        container.find('.prevBtn').show();
                    }
                    if (current >= total) {
                        container.find('.nextBtn').hide();
                        container.find('.submitBtn').show();
                    } else {
                        container.find('.nextBtn').show();
                        container.find('.submitBtn').hide();
                    }
                },
                onTabClick: function (tab, navigation, index) {
                    return false;
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    container.find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });
            container.find('.prevBtn').hide();
            container.find('.submitBtn').hide();

        }
    };
}();
window.wizard=wizard;