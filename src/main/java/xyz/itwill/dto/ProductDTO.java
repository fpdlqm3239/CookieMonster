package xyz.itwill.dto;

public class ProductDTO {
	private int no;
	private int price;
	private int count;
	private String category;
	private String name;
	private String thumbnail;
	private String description;

	private int recommand;
	private String receivingDate;
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	public int getRecommand() {
		return recommand;
	}

	public void setRecommand(int recommand) {
		this.recommand = recommand;
	}

	public String getReceivingDate() {
		return receivingDate;
	}

	public void setReceivingDate(String receivingDate) {
		this.receivingDate = receivingDate;
	}
	
	
}
