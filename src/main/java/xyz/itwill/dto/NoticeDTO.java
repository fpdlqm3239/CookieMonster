package xyz.itwill.dto;

/*
이름        널?       유형            
--------- -------- ------------- 
NO        NOT NULL NUMBER        
MEMBER_NO NOT NULL NUMBER        
TITLE     NOT NULL VARCHAR2(200) 
CONTENT            CLOB          
REGDATE            DATE          
READCOUNT          NUMBER        
PICTURE            VARCHAR2(200) 
 */

public class NoticeDTO {
	private int no;
	private int memberNo;
	private String title;
	private String content;
	private String regdate;
	private int readcount;
	private String picture;
	
	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
