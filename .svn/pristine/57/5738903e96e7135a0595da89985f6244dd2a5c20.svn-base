package xyz.itwill.dto;

import xyz.itwill.enums.EProductCategory;
import xyz.itwill.enums.EProductSelect;

public class ProductSearchDTO {
	EProductCategory category = EProductCategory.ALL;
	EProductSelect select = EProductSelect.ALL;
	String search = "";
	
	public ProductSearchDTO() {		
	}

	public EProductCategory getCategory() {
		return category;
	}

	public void setCategory(EProductCategory category) {
		this.category = category;
	}

	public EProductSelect getSelect() {
		return select;
	}

	public void setSelect(EProductSelect select) {
		this.select = select;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	public boolean isSomethingSearch() {
		return checkCategory() || checkSelect() || !searchBlank();
	}

	public boolean checkCategory() {
		return category != EProductCategory.ALL;
	}
	
	public boolean checkSelect() {
		return select != EProductSelect.ALL;
	}
	
	public boolean searchBlank() {
		return search.equals("");
	}
	
	public boolean searchDuplicate() {
		return checkCategory() || checkSelect();
	}
	
	public String makeSqlDuplicateCondition(String sql) {
		if(searchDuplicate()) {
			sql += "AND ";
		}
		return sql;
		
		//return searchDuplicate() ? sql : sql+"AND ";
	}
	
	public String makeSqlCategory(String sql) {
		//System.out.println(category);
		switch (category) {
		case SUNGLASS:
		case GLASSES:
		case TEST:
			sql += "category = lower('" + category.toString() + "') ";				
			break;
		default:
			break;
		}
		return sql;
	}
	
	public String makeSqlSelect(String sql) {
		//System.out.println(select);
		if(checkCategory() && checkSelect()) {
			sql += "AND ";
		}
		switch (select) {
		case RECOMMAND:
			sql += "recommand = 1 ";	
			break;
		case RECEIVING_DATE:
			sql += "(sysdate - to_date(receiving_date)) < 1 ";
			break;
		default:
			break;
		}
		return sql;
	}
	
	
}
