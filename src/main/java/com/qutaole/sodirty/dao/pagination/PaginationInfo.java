package com.qutaole.sodirty.dao.pagination;

import java.io.Serializable;


/**
 * 
 * @author legendhu
 * @date 2017年7月23日下午2:16:30
 */

public class PaginationInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// default value
	private static final Integer defaultCurrentPage = 1;

	public static final Integer defaultRecordPerPage = 20;

	public static final Integer MAX_RECORD_PER_PAGE = 10000;

	/**
	 * 当前页，1基址
	 */
	private Integer currentPage = null;

	/**
	 * 每页记录�?
	 */
	private Integer recordPerPage = null;

	/**
	 * 总页�?
	 */
	private Integer totalPage = null;

	/**
	 * 总记录数
	 */
	private Integer totalRecord = null;

	private void initialize() {
		this.currentPage = defaultCurrentPage;
		this.recordPerPage = defaultRecordPerPage;
	}

	public PaginationInfo(String temp) {
	}

	public PaginationInfo() {
		this.initialize();
	}

	public PaginationInfo(Integer currentPage, Integer recordPerPage) {
		this.setCurrentPage(currentPage);
		this.setRecordPerPage(recordPerPage);
	}

	public int getOffset() {
		return this.getRecordPerPage() * (this.getCurrentPage() - 1);
	}

	public int getLimit() {
		return this.getRecordPerPage();
	}

	public static PaginationInfo getDefault() {
		return new PaginationInfo(defaultCurrentPage, defaultRecordPerPage);
	}

	public Integer getCurrentPage() {
		return currentPage == null ? defaultCurrentPage : currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = (currentPage == null || currentPage <= 0) ? defaultCurrentPage : currentPage;
	}

	public Integer getRecordPerPage() {
		return recordPerPage == null ? defaultRecordPerPage : recordPerPage;
	}

	/**
	 * 外部可以设置的页大小必须有控�?
	 *
	 * @param recordPerPage
	 * @author leiting
	 * @since Sep 9, 2015
	 */
	public void setRecordPerPage(Integer recordPerPage) {
		if (recordPerPage == null || recordPerPage <= 0) {
			this.recordPerPage = defaultRecordPerPage;
		} else if (recordPerPage >= MAX_RECORD_PER_PAGE) {
			this.recordPerPage = MAX_RECORD_PER_PAGE;
		} else {
			this.recordPerPage = recordPerPage;
		}
	}

	public void unlimitRecordPerPage() {
		this.recordPerPage = Integer.MAX_VALUE;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(Integer totalRecord) {
		this.totalRecord = totalRecord;
		if ((this.getCurrentPage() - 1) * this.getRecordPerPage() >= this.totalRecord) {
			this.initialize();
		}
	}

	/**
	 * 根据总个数设置分享页信息 paginationInfo为null的情况下按照按照默认按照20分页，第1�?
	 * 
	 * @param paginationInfo
	 * @param totalCount
	 * @return
	 */
	public static PaginationInfo getFullInfoByTotalCount(PaginationInfo paginationInfo, Integer totalCount) {
		if (null == paginationInfo) {
			paginationInfo = new PaginationInfo(defaultCurrentPage, defaultRecordPerPage);
		} else {
			if (null == paginationInfo.getRecordPerPage() || 1 > paginationInfo.getRecordPerPage()) {
				paginationInfo.setRecordPerPage(defaultRecordPerPage);
			}
		}

		Integer totalRecord = 0;
		Integer totalPage = 0;
		if (null != totalCount) {
			totalRecord = totalCount;
			if (0 == totalCount % paginationInfo.getRecordPerPage()) {
				totalPage = totalCount / paginationInfo.getRecordPerPage();
			} else {
				totalPage = totalCount / paginationInfo.getRecordPerPage() + 1;
			}
		}
		paginationInfo.setTotalRecord(totalRecord);
		paginationInfo.setTotalPage(totalPage);
		return paginationInfo;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("[currentPage=");
		builder.append(currentPage);
		builder.append(", recordPerPage=");
		builder.append(recordPerPage);
		builder.append(", totalPage=");
		builder.append(totalPage);
		builder.append(", totalRecord=");
		builder.append(totalRecord);
		builder.append("]");
		return builder.toString();
	}
}
