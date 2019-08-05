package helper;

public class HelperVO {
    private String helperId;
    private String helper_Phone;
    private String helper_name;
    private String sex;
    private String bank_Name;
    private String account;
    private String account_Holder;
    private String wish_Addr_Front1;
    private String wish_Addr_Detail1;
    private String wish_Addr_Front2;
    private String wish_Addr_Detail2;
    private String wish_Addr_Front3;
    private String wish_Addr_Detail3;
    private String want_to_say;

    public void setHelperId(String helperId) {
        this.helperId = helperId;
    }

    public void setHelper_Phone(String helper_Phone) {
        this.helper_Phone = helper_Phone;
    }

    public void setHelper_Name(String helper_name) {
        this.helper_name = helper_name;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setBank_Name(String bank_Name) {
        this.bank_Name = bank_Name;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setAccount_Holder(String account_Holder) {
        this.account_Holder = account_Holder;
    }

    public void setWish_Addr_Front1(String wish_Addr_Front1) {
        this.wish_Addr_Front1 = wish_Addr_Front1;
    }

    public void setWish_Addr_Detail1(String wish_Addr_Detail1) {
        this.wish_Addr_Detail1 = wish_Addr_Detail1;
    }

    public void setWish_Addr_Front2(String wish_Addr_Front2) {
        this.wish_Addr_Front2 = wish_Addr_Front2;
    }

    public void setWish_Addr_Detail2(String wish_Addr_Detail2) {
        this.wish_Addr_Detail2 = wish_Addr_Detail2;
    }

    public void setWish_Addr_Front3(String wish_Addr_Front3) {
        this.wish_Addr_Front3 = wish_Addr_Front3;
    }

    public void setWish_Addr_Detail3(String wish_Addr_Detail3) {
        this.wish_Addr_Detail3 = wish_Addr_Detail3;
    }

    public void setWant_to_say(String want_to_say) {
        this.want_to_say = want_to_say;
    }

    public String getHelperId() {
        return helperId;
    }

    public String getHelper_Phone() {
        return helper_Phone;
    }

    public String getHelper_Name() {
        return helper_name;
    }

    public String getSex() {
        return sex;
    }

    public String getBank_Name() {
        return bank_Name;
    }

    public String getAccount() {
        return account;
    }

    public String getAccount_Holder() {
        return account_Holder;
    }

    public String getWish_Addr_Front1() {
        return wish_Addr_Front1;
    }

    public String getWish_Addr_Detail1() {
        return wish_Addr_Detail1;
    }

    public String getWish_Addr_Front2() {
        return wish_Addr_Front2;
    }

    public String getWish_Addr_Detail2() {
        return wish_Addr_Detail2;
    }

    public String getWish_Addr_Front3() {
        return wish_Addr_Front3;
    }

    public String getWish_Addr_Detail3() {
        return wish_Addr_Detail3;
    }

    public String getWant_to_say() {
        return want_to_say;
    }
}

/*
    create table helper(
        helperID varchar2(25),//대행아이디 -PK
        helper_photo_ofn varchar2(100),
        helper_photo_fsn varchar2(100) ,
        helper_phone varchar2(11) ,//전화번호
        helper_name varchar2(25) ,//이름
        sex varchar2(6) ,//성
        bank_name varchar2(18) ,//은행이름
        account varchar2(20) ,//계좌번호
        account_holder varchar2(25) , // 예금주
        wish_addr_front1 varchar2(40), //희망근무지1 시
        wish_addr_detail1 varchar2(45), //희망근무지1 동
        wish_addr_front2 varchar2(40), //희망근무지2 시
        wish_addr_detail2 varchar2(45), //희망근무지2 동
        wish_addr_front3 varchar2(40), //희망근무지3 시
        wish_addr_detail3 varchar2(45), //희망근무지3 동
        want_to_say varchar2(300) //하고싶은말
    );
*/