package global.sesoc.teamProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.teamProject.vo.BoardVO;

/**
 * 게시판 DAO
 */
@Repository
public class BoardDAO {
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 글 저장
	 * @param board 저장할 게시글 정보
	 * @return 저장된 레코드 수
	 */
	public int insertBoard(BoardVO board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.insertBoard(board);
		return result;
	}

	/**
	 * 글 번호로 해당 게시글 읽기
	 * @param boardnum 검색할 글번호
	 * @return 검색된 게시글 정보. 없으면 null.
	 */
	public BoardVO getBoard(int boardnum) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		//해당 번호의 글정보 읽기
		BoardVO board = mapper.getBoard(boardnum);
		//조회수 1증가
		return board;
	}
	
	/**
	 * 검색 결과 레코드 수
	 * @param searchText 검색어
	 * @return 글개수
	 */
	public int getTotal(String searchText) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int total = mapper.getTotal(searchText);
		return total;
	}
	
	/**
	 * 한 페이지의 게시글 목록 읽기
	 * @param searchText 검색어
	 * @param startRecord 전체 결과중 읽을 시작 위치 (첫 행은 0)
	 * @param countPerPage 읽을 레코드 수 (한 페이지당 글 개수)
	 * @return 글목록
	 */
	public ArrayList<BoardVO> listBoard(String searchText, int startRecord, int countPerPage) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<BoardVO> boardlist = mapper.listBoard(searchText, rb);
		return boardlist;
	}

	/**
	 * 글 번호로 해당 게시글 삭제
	 * @param 삭제할 글 번호와 로그인 아이디가 포함된 정보
	 * @return 삭제된 글 개수
	 */
	public int deleteBoard(BoardVO board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.deleteBoard(board);
		return result;
	}

	/**
	 * 게시글 수정
	 * @param board 수정할 글 정보
	 * @return 수정된 글 개수
	 */
	public int updateBoard(BoardVO board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.updateBoard(board);
		return result;
	}

}
