package xyz.itwill.enums;

public enum EMember {
	NO("식별자"),
	EMAIL("이메일"),
	PW("비밀번호"),
	STATUS("상태"),
	NAME("이름"),
	PHONE("번호"),
	BIRTH("생년월일"),
	MAIN_ADDRESS("메인주소"),
	DETAIL_LADDRESS("상세주소"),
	ZIPCODE("우편번호"),
	JOIN_DATE("가입일"),	
	LAST_JOIN_DATE("마지막로그인")	
	;
	
	private final String value;
	private EMember(String value) {this.value = value;}
	
	public static int size() {return values().length;}
	public String getValue() {return value;}	
}
