package global.sesoc.teamProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamProject.vo.ReservationVO;

@Repository
public class ReservationDAO {
	@Autowired
	private SqlSession session;

	// 락커 개수 확인
	public int nonReserved(String locker_name) {
		int num = 0;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		num = mapper.nonReserved(locker_name);
		return num;
	}

	// 락커 목록 출력
	public ArrayList<ReservationVO> lockerList(String locker_name) {
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		ArrayList<ReservationVO> list = mapper.lockerList(locker_name);
		return list;
	}
	// 락커 목록 출력
	public ReservationVO lockerList2(ReservationVO vo) {
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		ReservationVO ReservationVO = mapper.lockerList2(vo);
		return ReservationVO;
	}

	// 중복 예약 방지
	public int doubleCheck(String email) {
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		int num = 0;
		num = mapper.doubleCheck(email);
		return num;
	}

	// 예약하기
	public void reservation(ReservationVO vo) {
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		mapper.reservation(vo);
	} 
	//비회원 예약
	public void reservation2(ReservationVO vo) {
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		mapper.reservation2(vo);
	} 
	//결제 시 컬럼 변경
	public void paid(ReservationVO vo) {
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		mapper.paid(vo);
	}
	
	
	
	
	
	// 예약 내역 확인
	public ArrayList<ReservationVO> getReservation(String email) {
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		ArrayList<ReservationVO> list = mapper.getReservation(email);
		return list;
	}

	// 비회원 예약 내역 확인
	public ArrayList<ReservationVO> getReservation2(String email2) {
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		ArrayList<ReservationVO> list = mapper.getReservation2(email2);
		return list;
	}
	// 예약 취소
	public void cancle(ReservationVO vo) {
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		mapper.cancle(vo);
	}
	
	
	
	
}
