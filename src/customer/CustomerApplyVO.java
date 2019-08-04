package customer;

public class CustomerApplyVO {
	private String serialNo;
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getAddr_front() {
		return addr_front;
	}
	public void setAddr_front(String addr_front) {
		this.addr_front = addr_front;
	}
	public String getHelperID() {
		return helperID;
	}
	public void setHelperID(String helperID) {
		this.helperID = helperID;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
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
		this.trash_type =trash_type;
	}
	public String getTime_wanted() {
		return time_wanted;
	}
	public void setTime_wanted(String[] time_wanted) {
		StringBuffer sb=new StringBuffer();
		for(String l: time_wanted)
		{
			sb.append(l);
		}
		this.time_wanted = sb.toString();
	}
	public Integer getLast_time() {
		return last_time;
	}
	public void setLast_time(Integer last_time) {
		this.last_time = last_time;
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
	///bag_num,trash_type(0,1),last_time,price
	private String customer_phone;
	private String addr_front;
	private String helperID;
	private String addr_detail;
	private Integer bag_num;
	private Integer trash_type;
	private String time_wanted;
	private Integer last_time;
	private Integer price;
	private String card_num;
	private String customer_apply_day;
	//int vs integer
	@Override
	public String toString() {
		return "customer_applyVO [serialNo=" + serialNo + ", customer_phone=" + customer_phone + ", addr_front="
				+ addr_front + ", helperID=" + helperID + ", addr_detail=" + addr_detail + ", bag_num=" + bag_num
				+ ", trash_type=" + trash_type + ", time_wanted=" + time_wanted + ", last_time=" + last_time
				+ ", price=" + price + ", card_num=" + card_num + "]";
	}
	
	
}
