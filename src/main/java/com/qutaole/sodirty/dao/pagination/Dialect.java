package com.qutaole.sodirty.dao.pagination;

/**
 * dialect接口，提供生成分页和总和的sql
 * @author legendhu
 * @date 2017年7月23日下午7:40:28
 */
public interface Dialect {
	
	/**
	 * 是否支持物理分页
	 * 
	 * @return
	 */
	public boolean supportsLimit();
	
	/**
	 * 是否支持物理分页偏移
	 * 
	 * @return
	 */
	public boolean supportsLimitOffset();
	
	/**
	 * 分页查询
	 * 
	 * @param sql
	 * @param hasOffset
	 * @return
	 */
	public String getLimitString(String sql, boolean hasOffset);
	
	/**
	 * 分页查询
	 * 
	 * @param sql
	 * @param offset
	 * @param limit
	 * @return
	 */
	public String getLimitString(String sql, int offset, int limit);
	
	/**
	 * 生成查询总和的sql
	 * 
	 * @param sql
	 * @return
	 */
	public String getCountString(String sql);
	
}
