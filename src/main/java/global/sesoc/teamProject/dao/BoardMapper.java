package global.sesoc.teamProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.teamProject.vo.BoardVO;


/**
 * 게시판 관련 Mybatis 사용 메서드
 */
public interface BoardMapper {
	//글 저장
	public int insertBoard(BoardVO board);
	//글번호로 해당 게시글 검색
	public BoardVO getBoard(int boardnum);
	//검색 후의 총 글 개수
	public int getTotal(String searchText);
	//검색 후의 현재 페이지 목록
	public ArrayList<BoardVO> listBoard(String searchText, RowBounds rb);
	//글번호와 아이디로 해당 게시글 삭제
	public int deleteBoard(BoardVO board);
	//글 수정
	public int updateBoard(BoardVO board);
}
