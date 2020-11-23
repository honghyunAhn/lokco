package global.sesoc.teamProject.vo;

import lombok.Data;

@Data
public class PayVO {
	
//	private String pg;
//	private String pay_method;
//	private String merchant_uid;
	private int locker_n; //예약, 결제시 필요한 락커번호
	private String name; //주문자명
	private String locker_name; //락커명
	private String phone; //주문자 전화번호
	private String email; //주문자 이메일

}
