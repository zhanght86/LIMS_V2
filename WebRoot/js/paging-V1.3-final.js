/**
 *
 * @author 瞿龙俊
 * @version V1.3-final
 * @desc 用来生成不同样式的页码，用户可自定义样式，无限页码
 */

/**
 *
 * @param {Object} param:JSON,用户需要传入一个JSON对象，属性为：
 * pageCount（必需）：页码总数
 * initPage：初始页码位置
 * showCount：每次显示多少页
 * fn：回调函数，参数为当前页码数
 * liCss：默认页码样式，JSON格式
 * liActive：选中时页码的样式，JSON格式
 * liForbid：不可用时页码的样式,JSON格式
 *
 * 调用方法：父元素.paging(object)
 */
$.fn.paging = function(param) {
	/*封装参数*/
	var pagingParam = {
			'parent': $(this),
			'liCss': param.liCss,
			'liActive': param.liActive,
			'liForbid': param.liForbid,
			'nowShowMin': 0,
			'nowShowMax': 0,
			'nowIndex': 0,
			'selfPage': 0,
			'_thisUl': $('<ul>'),
			'nextPageBtn': 0,
			'result': null,
			'pageCount': param.pageCount,
			'initPage': param.initPage,
			'showCount': param.showCount,
			'fn': param.fn
		}
		/*若用户未定义，则设置初始默认值*/
	if (!pagingParam.pageCount) {
		console.log('pagingParam.pageCount(页码总数)参数必须设置！');
		return false;
	}
	/*若用户未定义，则设置初始默认值*/
	if (!pagingParam.initPage) {
		pagingParam.initPage = 1;
	}
	/*若用户未定义，则设置初始默认值*/
	if (!pagingParam.showCount) {
		pagingParam.showCount = pagingParam.pageCount;
	}
	/*若用户未定义，则设置初始默认值*/
	if (!pagingParam.fn) {
		pagingParam.fn = function() {};
	}
	/*若用户未定义，则设置初始默认值*/
	if (!pagingParam.liCss) {
		pagingParam.liCss = {
			'display': 'inline-block',
			'border': '1px solid #0099CC',
			'padding': '3px 10px',
			'cursor': 'pointer',
			'margin-right': '5px',
			'background': 'inherit',
			'pointer-events': 'auto'
		};
	}
	/*若用户未定义，则设置初始默认值*/
	if (!pagingParam.liForbid) {
		pagingParam.liForbid = {
			'background': '#999',
			'cursor': 'default',
			'pointer-events': 'none'
		};
	}
	/*若用户未定义，则设置初始默认值*/
	if (!pagingParam.liActive) {
		pagingParam.liActive = {
			'background': '#FF9900',
			'cursor': 'default',
			'pointer-events': 'none'
		};
	}
	pagingParam._thisUl.appendTo(pagingParam.parent); //新建一个ul标签
	pagingParam.result = nextPage(); //计算第一次显示的页码数
	pagingParam.nowIndex = pagingParam.initPage; //初始化当前页码
	pagingParam.selfPage = Math.ceil((pagingParam.nowShowMax - pagingParam.nowShowMin) / 2) + pagingParam.nowShowMin; //计算中间页码
	init(); //绘制页码
	pagingParam._thisUl.children('li:eq(' + (pagingParam.initPage + 1) + ')').css(pagingParam.liActive); //设置选中页码
	if (pagingParam.initPage == 1) { //禁用相关按钮
		pagingParam._thisUl.children('li:eq(1)').css(pagingParam.liForbid);
		pagingParam._thisUl.children('li:eq(0)').css(pagingParam.liForbid);
	}
	/*绘制页码函数*/
	function init() {
		$('<li>').text('首页').css(pagingParam.liCss).appendTo(pagingParam._thisUl); /*首页*/
		$('<li>').text('上一页').css(pagingParam.liCss).appendTo(pagingParam._thisUl); /*上一页*/
		for (var i = pagingParam.nowShowMin; i <= pagingParam.nowShowMax; i++) { /*遍历产生页码*/
			var newLi = $('<li>');
			newLi.click(selectPage); /*添加点击事件*/
			newLi.text(i).css(pagingParam.liCss).appendTo(pagingParam._thisUl);
		}
		$('<li>').text('下一页').css(pagingParam.liCss).appendTo(pagingParam._thisUl); /*下一页*/
		$('<li>').text('尾页').css(pagingParam.liCss).appendTo(pagingParam._thisUl); /*尾页*/
		pagingParam.nextPageBtn = pagingParam._thisUl.children('li').length - 2; /*计算下一页的index值*/
		if (!pagingParam.result) { /*判断是否到了最后一次*/
			pagingParam._thisUl.children('li:eq(' + pagingParam.nextPageBtn + ')').css(pagingParam.liForbid);
		}
		if(pagingParam.pageCount == 1){
			pagingParam._thisUl.children('li:last').css(pagingParam.liForbid);
		}
		pagingParam._thisUl.children('li:eq(' + pagingParam.nextPageBtn + ')').click(nextPageCount); /*绑定下一页事件*/
		pagingParam._thisUl.children('li:eq(0)').click(firstPage); /*绑定首页事件*/
		pagingParam._thisUl.children('li:last-of-type').click(lastPage); /*绑定尾页事件*/
		pagingParam._thisUl.children('li:eq(1)').click(frontPageCount); /*绑定上一页事件*/
	}

	/*下一页点击事件*/
	function nextPageCount() {
		pagingParam.result = nextPage();
		pagingParam._thisUl.empty();
		init();
		pagingParam._thisUl.children('li:eq(' + (pagingParam.nowIndex - pagingParam.nowShowMin + 2) + ')').css(pagingParam.liActive).siblings('li').css(pagingParam.liCss);
		if (!pagingParam.result) {
			pagingParam._thisUl.children('li:eq(' + pagingParam.nextPageBtn + ')').css(pagingParam.liForbid);
			pagingParam._thisUl.children('li:last-of-type').css(pagingParam.liForbid);
		}
		pagingParam.fn(getNowPage());
	}

	/*上一页点击事件*/
	function frontPageCount() {
		pagingParam.result = frontPage();
		pagingParam._thisUl.empty();
		init();
		pagingParam._thisUl.children('li:eq(' + (pagingParam.nowIndex - pagingParam.nowShowMin + 2) + ')').css(pagingParam.liActive).siblings('li').css(pagingParam.liCss);
		if (!pagingParam.result) {
			pagingParam._thisUl.children('li:eq(1)').css(pagingParam.liForbid);
			pagingParam._thisUl.children('li:first-of-type').css(pagingParam.liForbid);
		}
		pagingParam.fn(getNowPage());
	}

	/*计算下一次需要显示的页码数*/
	function nextPage() {
			//如果总页数大于每一页显示的页数
			if (pagingParam.pageCount > pagingParam.showCount) {
				//当前目录最大值已经是最后一页了
				if (pagingParam.nowShowMax >= pagingParam.pageCount) {
					pagingParam.nowShowMax = pagingParam.pageCount;
					if (pagingParam.nowIndex != pagingParam.pageCount) {
						pagingParam.nowIndex++;
					}
					return pagingParam.nowIndex != pagingParam.pageCount;
				}
				//如果不是最后一页，则往后移动一位
				if (pagingParam.nowIndex < pagingParam.selfPage) {
					pagingParam.nowIndex++;
				} else {
					pagingParam.nowShowMin++;
					pagingParam.nowShowMax = pagingParam.nowShowMin + pagingParam.showCount - 1;
					pagingParam.selfPage = Math.ceil((pagingParam.nowShowMax - pagingParam.nowShowMin) / 2) + pagingParam.nowShowMin; //获取当前屏幕中最中间那一页
					pagingParam.nowIndex++;
				}
				return true;
			} else {
				pagingParam.nowShowMin = 1;
				pagingParam.nowShowMax = pagingParam.pageCount;
				pagingParam.nowIndex++;
				return pagingParam.nowIndex != pagingParam.pageCount;
			}
		}
		/*计算上一次需要显示的页码数*/

	function frontPage() {
			//如果总页数大于每一页显示的页数
			if (pagingParam.pageCount > pagingParam.showCount) {
				if (pagingParam.nowShowMin <= 1) {
					pagingParam.nowShowMin = 1;
					if (pagingParam.nowIndex > 1) {
						pagingParam.nowIndex--;
					}
					return pagingParam.nowIndex != 1;
				}
				if (pagingParam.nowIndex > pagingParam.selfPage) {
					pagingParam.nowIndex--;
				} else {
					pagingParam.nowShowMin--;
					pagingParam.nowShowMax = pagingParam.nowShowMin + pagingParam.showCount - 1;
					pagingParam.selfPage = Math.ceil((pagingParam.nowShowMax - pagingParam.nowShowMin) / 2) + pagingParam.nowShowMin; //获取当前屏幕中最中间那一页
					pagingParam.nowIndex--;
				}
				return true;

			} else {
				pagingParam.nowShowMin = 1;
				pagingParam.nowShowMax = pagingParam.pageCount;
				pagingParam.nowIndex--;
				return pagingParam.nowIndex != 1;
			}
		}
		/*首页点击事件*/

	function firstPage() {
			while (frontPage()) {};
			pagingParam._thisUl.empty();
			init();
			pagingParam._thisUl.children('li:eq(' + (pagingParam.nowIndex - pagingParam.nowShowMin + 2) + ')').css(pagingParam.liActive).siblings('li').css(pagingParam.liCss);
			pagingParam._thisUl.children('li:eq(1)').css(pagingParam.liForbid);
			pagingParam._thisUl.children('li:first-of-type').css(pagingParam.liForbid);
			pagingParam.fn(getNowPage());
		}
		/*尾页点击事件*/

	function lastPage() {
			while (nextPage()) {};
			pagingParam._thisUl.empty();
			init();
			pagingParam._thisUl.children('li:eq(' + (pagingParam.nowIndex - pagingParam.nowShowMin + 2) + ')').css(pagingParam.liActive).siblings('li').css(pagingParam.liCss);
			pagingParam._thisUl.children('li:eq(' + pagingParam.nextPageBtn + ')').css(pagingParam.liForbid);
			pagingParam._thisUl.children('li:last-of-type').css(pagingParam.liForbid);
			pagingParam.fn(getNowPage());
		}
		/*选择页码点击事件*/

	function selectPage() {
		var _this = $(this);
		if (_this.text() == pagingParam.nowShowMax) {
			while (nextPage()) {
				if (pagingParam.selfPage == _this.text()) {
					break;
				}
			}
		}
		if (_this.text() == pagingParam.nowShowMin) {
			while (frontPage()) {
				if (pagingParam.selfPage == _this.text()) {
					break;
				}
			}
		}
		pagingParam.nowIndex = parseInt($(this).text());
		pagingParam._thisUl.empty();
		init();
		pagingParam._thisUl.children('li:eq(' + (pagingParam.nowIndex - pagingParam.nowShowMin + 2) + ')').css(pagingParam.liActive).siblings('li').css(pagingParam.liCss);
		if (pagingParam.nowIndex == 1) {
			pagingParam._thisUl.children('li:eq(1)').css(pagingParam.liForbid);
			pagingParam._thisUl.children('li:first-of-type').css(pagingParam.liForbid);
		}
		if (pagingParam.nowIndex == pagingParam.pageCount) {
			pagingParam._thisUl.children('li:eq(' + (pagingParam.nextPageBtn) + ')').css(pagingParam.liForbid);
			pagingParam._thisUl.children('li:last-of-type').css(pagingParam.liForbid);
		}
		pagingParam.fn(getNowPage());
	}

	function getNowPage() {
		return pagingParam.nowIndex;
	}
	pagingParam.fn(pagingParam.nowIndex);
}