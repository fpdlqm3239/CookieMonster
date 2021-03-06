package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.PictureDTO;

public class PictureDAO extends JdbcDAO{
	private static PictureDAO _dao;
	
	private PictureDAO() {}
	
	static {
		_dao = new PictureDAO();
	}
	
	public static PictureDAO getDAO() {
		return _dao;
	}
	
	
	public List<PictureDTO> selectPictureByProductNo(int productNo){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PictureDTO> pictureList = new ArrayList<PictureDTO>();
		
		try {
			con = getConnection();
			
			String sql = "select * from cm_picture where product_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PictureDTO picture = new PictureDTO();
				picture.setNo(rs.getInt("no"));
				picture.setProductNo(rs.getInt("product_no"));
				picture.setContent(rs.getString("content"));
				pictureList.add(picture);
			}
			
			
		} catch (SQLException e) {
			System.out.println("[에러]selectPictureByProductNo() sql오류 = "+ e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		
		return pictureList;
	}
	

	
	public void insertPicture(PictureDTO picture){
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();

			//String sql = "insert into cm_picture (no, product_no, content, reference_category) values(cm_picture_seq.nextval, 1, \"test\", null)";
			//String sql = "insert into cm_picture (no, product_no, content, reference_category) values(cm_picture_seq.nextval, ?, ?, 'test')";
			String sql = "insert into cm_picture values(cm_picture_seq.nextval, ?, ?, ?)";
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, picture.getProductNo());
			pstmt.setString(2, picture.getContent());

			pstmt.setString(3, picture.getContent());
			
			System.out.println(picture.getProductNo());
			System.out.println(picture.getContent());
			System.out.println(sql);
			
			int row = pstmt.executeUpdate(sql);		
			System.out.print(row);
		} catch (SQLException e) {
			System.out.println("[에러]insertPicture() sql오류 = "+ e.getMessage());
		}finally {
			close(con, pstmt);
		}
	}
}
