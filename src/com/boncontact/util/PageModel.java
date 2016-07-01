package com.boncontact.util;

import java.util.List;

public class PageModel<T> {
	private int page = 1; // 当前页
	public int totalPages = 0; // 总页数
	private int pageRecorders;// 每页5条数据
	private int totalRows = 0; // 总数据数
	private int pageStartRow = 0;// 每页的起始数
	private int pageEndRow = 0; // 每页显示数据的终止数
	private boolean hasNextPage = false; // 是否有下一页
	private boolean hasPreviousPage = false; // 是否有前一页
	private List<T> list;

	/**
	 * 
	 * @param list
	 * @param pageRecorders
	 */
	public PageModel(List<T> list, int pageRecorders) {
		init(list, pageRecorders);// 通过对象集，记录总数划分
	}

	/** */
	/**
	 * 初始化list，并告之该list每页的记录数
	 * 
	 * @param list
	 * @param pageRecorders
	 */
	public void init(List<T> list, int pageRecorders) {
		this.pageRecorders = pageRecorders;
		this.list = list;
		totalRows = list.size();

		hasPreviousPage = false;

		if ((totalRows % pageRecorders) == 0) {
			totalPages = totalRows / pageRecorders;
		} else {
			totalPages = totalRows / pageRecorders + 1;
		}

		if (page >= totalPages) {
			hasNextPage = false;
		} else {
			hasNextPage = true;
		}

		if (totalRows < pageRecorders) {
			this.pageStartRow = 0;
			this.pageEndRow = totalRows;
		} else {
			this.pageStartRow = 0;
			this.pageEndRow = pageRecorders;
		}
	}

	public String displayForPage(String method) {
		StringBuffer sb = new StringBuffer();
		sb.append("<div class=\"w-page\"><label class=\"fr\">");

		// 判断是否有上一页
		if (this.isHasPreviousPage()) {
			sb.append("<a href=\"javascript:void(0)\" onclick=\"" + method
					+ "('" + String.valueOf(this.getPage() - 1)
					+ "');return false;\">上一页</a>");
		} else {
			sb.append("<span class=\"disabled\">上一页</span>");
		}

		// 中间显示
		for (int i = 1; i <= this.getTotalPages(); i++) {
			String spanClzz = "<a href=\"javascript:void(0)\" onclick=\""
					+ method + "('" + String.valueOf(i) + "');return false;\">"
					+ i + "</a>";

			if (this.page == i) {
				spanClzz = "<span class='current'>" + i + "</span>";
			}
			sb.append(spanClzz);

			// 当大于9页数的时候才进行分页显示
			if (this.getTotalPages() - 2 > 7) {
				if (i == 5) {
					i = this.getTotalPages() - 2;
					sb.append("...");
				}
			}
		}
		// 判断是否有下一页
		if (this.isHasNextPage()) {
			sb.append("<a href=\"javascript:void(0)\" onclick=\"" + method
					+ "('" + String.valueOf(this.getPage() + 1)
					+ "');return false;\">下一页</a>");

		} else {
			sb.append("<span class=\"disabled\">下一页</span>");
		}

		sb.append("</div>");
		return sb.toString();
	}

	public String displayForPage() {
		StringBuffer sb = new StringBuffer();
		sb.append("<div class=\"w-page\"><label class=\"fr\">");

		// 判断是否有上一页
		if (this.isHasPreviousPage()) {
			sb.append("<a href=\"javascript:void(0)\" onclick=\"findDistResult('"
					+ String.valueOf(this.getPage() - 1)
					+ "');return false;\">上一页</a>");
		} else {
			sb.append("<span class=\"disabled\">上一页</span>");
		}

		// 中间显示
		for (int i = 1; i <= this.getTotalPages(); i++) {
			String spanClzz = "<a href=\"javascript:void(0)\" onclick=\"findDistResult('"
					+ String.valueOf(i) + "');return false;\">" + i + "</a>";

			if (this.page == i) {
				spanClzz = "<span class='current'>" + i + "</span>";
			}
			sb.append(spanClzz);

			// 当大于9页数的时候才进行分页显示
			if (this.getTotalPages() - 2 > 7) {
				if (i == 5) {
					i = this.getTotalPages() - 2;
					sb.append("...");
				}
			}
		}
		// 判断是否有下一页
		if (this.isHasNextPage()) {
			sb.append("<a href=\"javascript:void(0)\" onclick=\"findDistResult('"
					+ String.valueOf(this.getPage() + 1)
					+ "');return false;\">下一页</a>");

		} else {
			sb.append("<span class=\"disabled\">下一页</span>");
		}

		sb.append("</div>");
		return sb.toString();
	}

	// 判断要不要分页
	public boolean isNext() {
		return list.size() > 5;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	/**
	 * 
	 * @return
	 */
	public List<T> getNextPage() {
		page = page + 1;
		disposePage();
		return getObjects(page);
	}

	/**
	 * 处理分页
	 */
	private void disposePage() {
		if (page == 0) {
			page = 1;
		}
		if ((page - 1) > 0) {
			hasPreviousPage = true;
		} else {
			hasPreviousPage = false;
		}

		if (page >= totalPages) {
			hasNextPage = false;
		} else {
			hasNextPage = true;
		}
	}

	/**
	 * 上一页
	 * 
	 * @return
	 */
	public List<T> getPreviousPage() {
		page = page - 1;

		if ((page - 1) > 0) {
			hasPreviousPage = true;
		} else {
			hasPreviousPage = false;
		}
		if (page >= totalPages) {
			hasNextPage = false;
		} else {
			hasNextPage = true;
		}
		return getObjects(page);
	}

	/**
	 * 获取第几页的内容
	 * 
	 * @param page
	 * @return
	 */
	public List<T> getObjects(int page) {
		if (page == 0) {
			this.setPage(1);
			page = 1;
		} else {
			this.setPage(page);
		}

		this.disposePage();

		if (page * pageRecorders < totalRows) {// 判断是否为最后一页
			pageEndRow = page * pageRecorders;
			pageStartRow = pageEndRow - pageRecorders;
		} else {
			pageEndRow = totalRows;
			pageStartRow = pageRecorders * (totalPages - 1);
		}

		List<T> objects = null;
		if (!list.isEmpty()) {
			objects = list.subList(pageStartRow, pageEndRow);
		}
		return objects;
	}

	/**
	 * 第一页
	 * 
	 * @return
	 */
	public List<T> getFistPage() {
		if (this.isNext()) {
			return list.subList(0, pageRecorders);
		} else {
			return list;
		}
	}

	/**
	 * @return the page
	 */
	public int getPage() {
		return page;
	}

	/**
	 * @param page
	 *            the page to set
	 */
	public void setPage(int page) {
		this.page = page;
	}

	/**
	 * @return the totalPages
	 */
	public int getTotalPages() {
		return totalPages;
	}

	/**
	 * @param totalPages
	 *            the totalPages to set
	 */
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	/**
	 * @return the pageRecorders
	 */
	public int getPageRecorders() {
		return pageRecorders;
	}

	/**
	 * @param pageRecorders
	 *            the pageRecorders to set
	 */
	public void setPageRecorders(int pageRecorders) {
		this.pageRecorders = pageRecorders;
	}

	/**
	 * @return the totalRows
	 */
	public int getTotalRows() {
		return totalRows;
	}

	/**
	 * @param totalRows
	 *            the totalRows to set
	 */
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	/**
	 * @return the pageStartRow
	 */
	public int getPageStartRow() {
		return pageStartRow;
	}

	/**
	 * @param pageStartRow
	 *            the pageStartRow to set
	 */
	public void setPageStartRow(int pageStartRow) {
		this.pageStartRow = pageStartRow;
	}

	/**
	 * @return the pageEndRow
	 */
	public int getPageEndRow() {
		return pageEndRow;
	}

	/**
	 * @param pageEndRow
	 *            the pageEndRow to set
	 */
	public void setPageEndRow(int pageEndRow) {
		this.pageEndRow = pageEndRow;
	}

	/**
	 * @return the hasNextPage
	 */
	public boolean isHasNextPage() {
		return hasNextPage;
	}

	/**
	 * @param hasNextPage
	 *            the hasNextPage to set
	 */
	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	/**
	 * @return the list
	 */
	public List<T> getList() {
		return list;
	}

	/**
	 * @param list
	 *            the list to set
	 */
	public void setList(List<T> list) {
		this.list = list;
	}

	/**
	 * @return the hasPreviousPage
	 */
	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}
}
