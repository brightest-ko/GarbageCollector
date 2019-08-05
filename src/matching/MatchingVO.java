package matching;

public class MatchingVO {
	private String helperID;
	private boolean suggestion;
	private boolean acceptance;
	public String getHelperID() {
		return helperID;
	}
	public void setHelperID(String helperID) {
		this.helperID = helperID;
	}
	public boolean isSuggestion() {
		return suggestion;
	}
	public void setSuggestion(boolean suggestion) {
		this.suggestion = suggestion;
	}
	public boolean isAcceptance() {
		return acceptance;
	}
	public void setAcceptance(boolean acceptance) {
		this.acceptance = acceptance;
	}
	
}

/*
create table matching(
	serialNo varchar2(8) not null, // 怨�媛���泥� 踰��� - PK, FK
	helperID varchar2(25),//�������대�� - PK, FK
	suggestion number(1) not null check (test in (0,1)),
	acceptance number(1) not null check (test in (0,1))
);
constraint matching_pk primary key (serialNo, helperID );
constraint matching_serialNo_fk foreign key references customer_apply (serialNo);
constraint matching_helperID_fk foreign key references helper (helperID);
*/