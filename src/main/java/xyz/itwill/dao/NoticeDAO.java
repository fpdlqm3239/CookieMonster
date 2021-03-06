package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.NoticeDTO;

public class NoticeDAO extends JdbcDAO{
	private static NoticeDAO _dao;
	
	private NoticeDAO() {
	}
	
	static {
		_dao = new NoticeDAO();
	}
	
	public static NoticeDAO getDAO() {
		return _dao;
	}
	
	//공지글 받아 삽입 후 행갯수 반환
	public int insertNotice(NoticeDTO notice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			con = getConnection();
			
			String sql = 
				"insert into cm_notice values(cm_notice_seq.nextval,?,?,?,sysdate,0,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice.getMemberNo());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());
			pstmt.setString(4, notice.getPicture());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertNotice() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//공지글 받아 변경 후 행갯수 반환
	public int updateNotice(NoticeDTO notice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql =
				"update cm_notice set title=?,content=?,picture=? where no=?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getPicture());
			pstmt.setInt(4, notice.getNo());
						
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateNotice() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows; 
	}
	
	//글번호 받아 조회수 변경 후 행갯수 반환
	public int updateReadCount(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "update cm_notice set readcount=readcount+1 where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//글번호 받아 삭제 후 행갯수 반환
	public int deleteNotice(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = 
				"delete from cm_notice where no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteNotice() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows; 
	}
	
	//글번호 받아 검색
	public NoticeDTO selectNoNotice(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeDTO notice = null;
		
		try {
			con = getConnection();
			
			String sql = 
				"select * from cm_notice where no=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = new NoticeDTO();
				notice.setNo(rs.getInt("no"));
				notice.setMemberNo(rs.getInt("member_no"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setRegdate(rs.getString("regdate"));
				notice.setReadcount(rs.getInt("readcount"));
				notice.setPicture(rs.getString("picture"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNoNotice() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return notice;
	}
	
	
	//CM_NOTICE_SEQ 시퀸스의 자동 증가값 검색
	public int selectNextNo() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int nextNo = 0;
		try {
			con = getConnection();
			
			String sql = "select cm_notice_seq.nextval from dual";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nextNo = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNextNo() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return nextNo;
	}
	
	//전체 글 갯수 반환 (검색 항목, 단어 전달받아 검색 기능 제공)
	public int selectNoticeCount(String search, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
			
			if(keyword.equals("")) {	//검색 기능 미사용시
				String sql = 
					"select count(*) from cm_notice";
				pstmt = con.prepareStatement(sql);
			} else {	//검색 기능 사용시
				String sql = "select count(*) from cm_notice where " + search + " like '%'||?||'%'";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs = pstmt.executeQuery();
			 
 			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNoticeCount() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			 close(con, pstmt, rs);
		}
		return count;
	}
	
	//시작행, 종료행 받아 해당 범위의 글 목록 반환
	public List<NoticeDTO> selectNoticeList(int startRow, int endRow, String search, String keyword){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		try {
			con = getConnection();
			
			if(keyword.equals("")) {
				String sql = 
						"select * from (select rownum rn,temp.* from "
						+ "(select * from cm_notice order by no desc) temp) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql = "select * from (select rownum rn,temp.* from "
							+ "(select * from cm_notice where " + search + " like '%'||?||'%'"
							+ "order by no desc) temp) where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNo(rs.getInt("no"));
				notice.setMemberNo(rs.getInt("member_no"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setRegdate(rs.getString("regdate"));
				notice.setReadcount(rs.getInt("readcount"));
				notice.setPicture(rs.getString("picture"));

				noticeList.add(notice);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNoticeList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return noticeList;
	}
}
