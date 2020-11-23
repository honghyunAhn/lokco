package global.sesoc.teamProject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamProject.vo.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSession session;

	// 회원가입
	public int insertMember(MemberVO vo) {
		int result = 0;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		result = mapper.insertMember(vo);
		return result;
	}

	// 이메일 중복확인
	public int doubleCheck(String email) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int count = 0;
		count = mapper.doubleCheck(email);
		return count;
	}

	// 회원 정보
	public MemberVO getMember(String email) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberVO vo = mapper.getMember(email);
		return vo;
	}

	// 비회원 이메일 저장
	public void non_memberInsert(String email) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		mapper.non_memberInsert(email);
	}

	// 비회원 조회
	public int non_login(String email2) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int num = mapper.non_login(email2);
		return num;
	}

}
