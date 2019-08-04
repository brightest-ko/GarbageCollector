package review;

import java.util.Date;

public class ReviewVO {
	public Integer getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(Integer serialNo) {
		this.serialNo = serialNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewPwd() {
		return reviewPwd;
	}
	public void setReviewPwd(String reviewPwd) {
		this.reviewPwd = reviewPwd;
	}
	public String getHelperID() {
		return helperID;
	}
	public void setHelperID(String helperID) {
		this.helperID = helperID;
	}
	public Date getReviewDay() {
		return reviewDay;
	}
	public void setReviewDay(Date reviewDay) {
		this.reviewDay = reviewDay;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getCleanPlaceAddFront() {
		return cleanPlaceAddFront;
	}
	public void setCleanPlaceAddFront(String cleanPlaceAddFront) {
		this.cleanPlaceAddFront = cleanPlaceAddFront;
	}
	public String getReviewContent() {
		return review_content;
	}
	public void setReviewContent(String review_content) {
		this.review_content = review_content;
	}
	private Integer serialNo; // 고객신청번호 (PK,FK)
	private String reviewTitle; // 글제목
	private String reviewPwd; // 글 패스워드
	private String helperID; // 대행자ID
	private Date reviewDay; // 글 작성일자
	private double rating; // 평점
	private String cleanPlaceAddFront; // 클린하우스 위치
	private String review_content; // 글내용 
}

/*
create table review(
	serialNo int(8) not null,
	helperID varchar2(25) not null,
	review_title varchar2(60) not null, 
	review_pwd varchar2(12) not null,
	rating number(5,1) not null, 
	clean_place_add_front varchar2(95), 
	review_content varchar2(900),
	review_day date not null
)
 */