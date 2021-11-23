package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.MemberDTO;

public class MemberDAO extends JdbcDAO {
	private static MemberDAO _dao;

	private MemberDAO() {
	}

	static {
		_dao = new MemberDAO();
	}

	public static MemberDAO getDAO() {
		return _dao;
	}

//회원정보를 전달받아 MEMBER 테이블에 삽입하여 저장하고 삽입행의 갯수를 반환하는 메소드

	public int insertMember(MemberDTO member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into cm_member values(cm_member_seq.nextval,?,?,1,?,?,sysdate,?,?,?,sysdate, null)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getMainAddress());
			pstmt.setString(6, member.getDetailAddress());
			pstmt.setString(7, member.getZipcode());

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("[에러]insertMember() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// 이메일 전달받아 MEMBER 테이블에 저장된 회원정보를 검색하여 반환하는 메소드

	public MemberDTO selectMember(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = null;
		try {
			con = getConnection();

			String sql = "select * from cm_member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberDTO();
				member.setNo(rs.getInt("no"));
				member.setEmail(rs.getString("email"));
				member.setPw(rs.getString("pw"));
				member.setStatus(rs.getString("status"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setBirth(rs.getString("birth"));
				member.setMainAddress(rs.getString("main_address"));
				member.setDetailAddress(rs.getString("detail_address"));
				member.setZipcode(rs.getString("zipcode"));
				member.setJoinDate(rs.getString("join_date"));
				member.setLastJoinDate(rs.getString("last_join_date"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectMember() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}

	// 이메일을 전달받아 MEMBER 테이블에 저장된 해당 회원정보의 마지막 로그인 날짜를 변경하고
	// 변경행의 갯수를 반환하는 메소드
	public int updateLastJoinDate(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update cm_member set last_join_date=sysdate where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateLastJoinDate() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// 회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 변경행의 갯수를 반환하는 메소드

	public int updateMember(MemberDTO member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update cm_member set pw=?,name=?,phone=?,birth=?,main_address=?, detail_address=?,zipcode=? where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getMainAddress());
			pstmt.setString(6, member.getDetailAddress());
			pstmt.setString(7, member.getZipcode());
			pstmt.setString(8, member.getEmail());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateMember() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// 이메일을 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보를 삭제하고 삭제행의
	// 갯수를 반환하는 메소드
	public int deleteMember(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update cm_member set status=2 where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteMember() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int deleteDBMember(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete cm_member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteDBMember() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	

	public int updateStatus(int no, String status) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update cm_member set status=? where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setInt(2, no);
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updatestatus() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	// MEMBER 테이블에 저장된 모든 회원정보를 검색하여 반환하는 메소드
	
	public String selectStatusByNo(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String returnStr = "something wrong";
		try {
			con = getConnection();

			String sql = "select name, status from cm_member where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			rs.next();
			if(rs.getString("status").equals("1")) {
				returnStr = "일반회원";
			}
			if(rs.getString("status").equals("2")) {
				returnStr = "탈퇴회원";
			}
			if(rs.getString("status").equals("9")) {
				returnStr = "관리자";
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectStatusByNo() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return returnStr;
	}
	
	public String selectNameByNo(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String returnStr = "something wrong";
		try {
			con = getConnection();

			String sql = "select name from cm_member where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			rs.next();
			returnStr = rs.getString("name");			
		} catch (SQLException e) {
			System.out.println("[에러]selectNameByNo() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return returnStr;
	}

	public List<MemberDTO> selectAllMemberList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			con = getConnection();

			String sql = "select * from cm_member order by no";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setNo(rs.getInt("no"));
				member.setEmail(rs.getString("email"));
				member.setPw(rs.getString("pw"));
				member.setStatus(rs.getString("status"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setBirth(rs.getString("birth"));
				member.setMainAddress(rs.getString("main_address"));
				member.setDetailAddress(rs.getString("detail_address"));
				member.setZipcode(rs.getString("zipcode"));
				member.setJoinDate(rs.getString("join_date"));
				member.setLastJoinDate(rs.getString("last_join_date"));
				memberList.add(member);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllMemberList() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return memberList;
	}

	// 아이디와 상태를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원상태를 변경하고
	// 변경행의 갯수를 반환하는 메소드
	public int updateStatus(String email, int status) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update cm_member set status=? where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setString(2, email);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//email 찾아줄때
	public MemberDTO selectMemberByEmail(String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MemberDTO member = null;
		try {
			con = getConnection();
			
			String sql = "select * from cm_member where phone = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO();
				member.setNo(rs.getInt("no"));
				member.setEmail(rs.getString("email"));
				member.setPw(rs.getString("pw"));
				member.setStatus(rs.getString("status"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setBirth(rs.getString("birth"));
				member.setMainAddress(rs.getString("main_address"));
				member.setDetailAddress(rs.getString("detail_address"));
				member.setZipcode(rs.getString("zipcode"));
				member.setJoinDate(rs.getString("join_date"));
				member.setJoinDate(rs.getString("last_join_date"));

			}
		}catch (SQLException e) {
			System.out.println("member 테이블  returnEmail 오류=>" + e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	
	//비밀번호 재설정 
	
	public int resetPw(MemberDTO member, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update cm_member set pw =? where email=?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, pw);
			pstmt.setString(2, member.getEmail());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("member 테이블 resetPassword 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
}