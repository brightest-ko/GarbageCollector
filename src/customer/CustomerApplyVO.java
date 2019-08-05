package customer;
import java.util.Date;

public class CustomerApplyVO {
	private Integer serialNo;
	private String customer_phone;
	private String customer_addr_front;
	private String customer_addr_detail;
	private Integer bag_num;
	private Integer trash_type;
	private Date wanted_time;
	private Integer price;
	private String card_num;
	private String helperID;
	private String customer_apply_day;
	private Integer certify_status;
	private Integer review_status;
	public Integer getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(Integer serialNo) {
		this.serialNo = serialNo;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getCustomer_addr_front() {
		return customer_addr_front;
	}
	public void setCustomer_addr_front(String customer_addr_front) {
		this.customer_addr_front = customer_addr_front;
	}
	public String getCustomer_addr_detail() {
		return customer_addr_detail;
	}
	public void setCustomer_addr_detail(String customer_addr_detail) {
		this.customer_addr_detail = customer_addr_detail;
	}
	public Integer getBag_num() {
		return bag_num;
	}
	public void setBag_num(Integer bag_num) {
		this.bag_num = bag_num;
	}
	public Integer getTrash_type() {
		return trash_type;
	}
	public void setTrash_type(Integer trash_type) {
		this.trash_type = trash_type;
	}
	public Date getWanted_time() {
		return wanted_time;
	}
	public void setWanted_time(Date wanted_time) {
		this.wanted_time = wanted_time;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getHelperID() {
		return helperID;
	}
	public void setHelperID(String helperID) {
		this.helperID = helperID;
	}
	public String getCustomer_apply_day() {
		return customer_apply_day;
	}
	public void setCustomer_apply_day(String customer_apply_day) {
		this.customer_apply_day = customer_apply_day;
	}
	public Integer getCertify_status() {
		return certify_status;
	}
	public void setCertify_status(Integer certify_status) {
		this.certify_status = certify_status;
	}
	public Integer getReview_status() {
		return review_status;
	}
	public void setReview_status(Integer review_status) {
		this.review_status = review_status;
	}
	
}

/*

	serialNo number not null, // 고객신청 번호 - PK
	customer_phone varchar2(11) not null, // 고객 전화번호 - FK
	customer_addr_front varchar2(40) not null , // 본인주소 (상세주소제외)
	customer_addr_detail varchar2(45) not null, // 상세주소
	bag_num number not null, // 봉투갯수
	trash_type number not null, // 분리수거종류
//오늘날짜 체크해서 해당되는 종류  radio or selectbox
//혼합:오늘날짜아닌것,섞인것 
	wanted_time date not null, // 원하는수거시간대
	
	// 날짜 선택 할지 말지 정하자 

	price number not null, // 가격
//당일 수거 물품(클린하우스로 배출 가능한 물품) :  1500
//당일 수거 이외 물품 & 혼합 : 2500

	card_num varchar2(20) not null // 카드번호
	helperID varchar2(25), // 대행ID
customer_apply_day date not null 


*/
