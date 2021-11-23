package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.ReviewDTO;

public class ReviewDAO extends JdbcDAO {
	private static ReviewDAO _dao;
	
	private ReviewDAO() {
	}
	
	static {
		_dao = new ReviewDAO();
	}
	
	public static ReviewDAO getDAO() {
		return _dao;
	}
	
	public ReviewDTO selectReviewByNo(String reviewNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewDTO review = null;
		
		try {
			con = getConnection();
			
			String sql = "select * from cm_review where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				review = new ReviewDTO();
				
				review.setNo(rs.getInt("no"));
				review.setMemberNo(rs.getInt("member_no"));
				review.setProductNo(rs.getInt("product_no"));
				review.setScore(rs.getInt("score"));
				review.setTitle(rs.getString("title"));
				review.setPicture(rs.getString("picture"));
				review.setContent(rs.getString("content"));
				review.setWriter(rs.getString("writer"));
				review.setCreateDate(rs.getString("create_date"));
				review.setUpdateDate(rs.getString("update_date"));
				
				
			}
			
			
			
			
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewByNo() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return review;
	}
	
	
	
	public List<ReviewDTO> selectReviewByProductNo(String productNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		try {
			con = getConnection();
			
			String sql = "select * from cm_review where product_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO review = new ReviewDTO();
				
				review.setNo(rs.getInt("no"));
				review.setMemberNo(rs.getInt("member_no"));
				review.setProductNo(rs.getInt("product_no"));
				review.setScore(rs.getInt("score"));
				review.setTitle(rs.getString("title"));
				review.setPicture(rs.getString("picture"));
				review.setContent(rs.getString("content"));
				review.setWriter(rs.getString("writer"));
				review.setCreateDate(rs.getString("create_date"));
				review.setUpdateDate(rs.getString("update_date"));
				reviewList.add(review);
				
			}
			
			
			
			
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewByProductNo() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return reviewList;
	}
	
	
	public int insertReview(ReviewDTO review) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			
			con = getConnection();

			String sql = "insert into cm_review values(cm_review_seq.nextval,?,?,?,?,?,?,sysdate,null,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review.getMemberNo());
			pstmt.setInt(2, review.getProductNo());
			pstmt.setInt(3, review.getScore());
			pstmt.setString(4, review.getTitle());
			pstmt.setString(5, review.getPicture());
			pstmt.setString(6, review.getContent());
			pstmt.setString(7, review.getWriter());
			
			rows = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
		
		return rows;
	}
	
	
	public int selectReviewCount(String productNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			
			String sql = "select count(*) from cm_review where product_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
				
			}
			
			
			
			
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewByProductNo() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	
	public List<ReviewDTO> selectReviewList(String productNo, int startRow, int endRow) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		try {
			con = getConnection();
			
			String sql = "select * from (select rownum rn, temp.* from (select * from cm_review where product_no =? order by no desc) temp) where rn between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO review = new ReviewDTO();
				
				review.setNo(rs.getInt("no"));
				review.setMemberNo(rs.getInt("member_no"));
				review.setProductNo(rs.getInt("product_no"));
				review.setScore(rs.getInt("score"));
				review.setTitle(rs.getString("title"));
				review.setPicture(rs.getString("picture"));
				review.setContent(rs.getString("content"));
				review.setWriter(rs.getString("writer"));
				review.setCreateDate(rs.getString("create_date"));
				review.setUpdateDate(rs.getString("update_date"));
				reviewList.add(review);
				
			}
			
			
			
			
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewList() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return reviewList;
	} 
	
	
	public int updateReview(ReviewDTO review) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			
			con = getConnection();

			String sql = "update cm_review set score=?, title=?,picture=?,content=?, update_date=sysdate where no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review.getScore());
			pstmt.setString(2, review.getTitle());
			pstmt.setString(3, review.getPicture());
			pstmt.setString(4, review.getContent());
			pstmt.setInt(5, review.getNo());
			
			
			rows = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
		
		return rows;
	}
	
	
	public int deleteReview(String reviewNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			
			con = getConnection();

			String sql = "delete cm_review where no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewNo);
			
			rows = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
		
		return rows;
	}
	
	
}
