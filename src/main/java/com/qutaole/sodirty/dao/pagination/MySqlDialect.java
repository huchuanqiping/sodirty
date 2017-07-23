package com.qutaole.sodirty.dao.pagination;


public class MySqlDialect implements Dialect {

	@Override
    public boolean supportsLimit() {
	    return true;
    }

	@Override
    public boolean supportsLimitOffset() {
	    return true;
    }

	@Override
    public String getLimitString(String sql, boolean hasOffset) {
	    return null;
    }

	@Override
    public String getLimitString(String sql, int offset, int limit) {
		StringBuilder buf = new StringBuilder(sql);
		buf.append("  ").append("limit ").append(offset).append(", ").append(limit);
		
	    return buf.toString();
    }

	@Override
    public String getCountString(String sql) {
	    // 去除\t\r\n和多余的空格 字符
		sql = sql.replaceAll("\\t", " ").replaceAll("\\r", " ").replaceAll("\\n", " ").replaceAll("\\s{2,}", " ");
		// 由于from可能作为表字段的�?��分，�?��这里把SQL去除多余的特殊字符和空格后再�? from "
		String resultSql = "select count(1) " + sql.substring(sql.toLowerCase().indexOf(" from "), sql.length());
		if (resultSql.toLowerCase().lastIndexOf("order by") != -1) {
			resultSql = resultSql.substring(0, resultSql.toLowerCase().lastIndexOf("order by"));
		}
		
		return resultSql;
    }

	public static void main(String[] args) {
		MySqlDialect dialect = new MySqlDialect();
		
	    String sql = "select a from b order by a";
	    String result = dialect.getLimitString(sql, 20, 20);
	    System.out.println(result);
	    
	    result = dialect.getCountString(sql);
	    System.out.println(result);
    }
}
