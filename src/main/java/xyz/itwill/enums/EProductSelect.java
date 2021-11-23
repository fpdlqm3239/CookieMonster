package xyz.itwill.enums;

public enum EProductSelect {
	ALL("전체"),
	RECOMMAND("추천"),
	RECEIVING_DATE("신상품")
	;
	
	private final String value;
	private EProductSelect(String value) {this.value = value;}
	
	public static int size() {return values().length;}
	public String getValue() {return value;}	
}
