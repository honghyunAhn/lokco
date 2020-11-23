package global.sesoc.teamProject.dao;

import java.util.ArrayList;

import global.sesoc.teamProject.vo.ReservationVO;

public interface ReservationMapper {
	//예약 가능 개수 확인
	public int nonReserved(String locker_name);
	//목록 출력
	public ArrayList<ReservationVO> lockerList(String locker_name);
	//결제를 위한 목록출력
	public ReservationVO lockerList2(ReservationVO vo);
	//중복 예약 방지
	public int doubleCheck(String email);
	//예약하기
	public void reservation(ReservationVO vo);
	//비회원 예약하기
	public void reservation2(ReservationVO vo);
	//결제시 컬럼 변경
	public void paid(ReservationVO vo);
	
	//예약 내역 확인
	public ArrayList<ReservationVO> getReservation(String email);
	//비회원 예약 내역 확인
	public ArrayList<ReservationVO> getReservation2(String email2);

	//예약 취소
	public void cancle(ReservationVO vo);
}
