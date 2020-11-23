package global.sesoc.teamProject.dao;

import global.sesoc.teamProject.vo.MemberVO;

public interface MemberMapper {
	//회원 가입
	public int insertMember(MemberVO vo);
	//이메일 중복확인
	public int doubleCheck(String email);
	//회원 정보
	public MemberVO getMember(String email);
	//비회원 이메일 저장
	public void non_memberInsert(String email);
	//비회원 조회
	public int non_login(String email2);

}
