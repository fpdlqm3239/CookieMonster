package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.CartDTO;

public class CartDAO extends JdbcDAO{
	private  static CartDAO _dao;
	
	private CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new CartDAO();
	}
	
	public static CartDAO getDAO() {
		return _dao;
	}
	
	
	public int insertCart(CartDTO cart) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="insert into cm_cart values(CM_CART_SEQ.NEXTVAL, ?,?,?)";
			//String sql="insert into cm_cart values(?,?,?,?)";
			
			pstmt=con.prepareStatement(sql);
			//pstmt.setInt(1, cart.getNo());
			pstmt.setInt(1, cart.getMemberNo());
			pstmt.setInt(2, cart.getProductNo());
			pstmt.setInt(3, cart.getCount());
			
			//System.out.println(sql);
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insert cm_Cart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	
	public int updateCart(CartDTO cart) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update cm_cart set memberNo=?,productNo=?,count=? where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cart.getMemberNo());
			pstmt.setInt(2, cart.getProductNo());
			pstmt.setInt(3, cart.getCount());
			pstmt.setInt(4, cart.getNo());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]update cm_Cart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public int deleteCart(int memberNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from cm_cart where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]delete cm_Cart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	

	public int deleteAllCart(int memberNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from cm_cart where member_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]delete cm_Cart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	


	public CartDTO selectCart(int memberNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CartDTO cart=null;
		try {
			con=getConnection();
			
			String sql="select * from cm_cart where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				cart=new CartDTO();
				cart.setNo(rs.getInt("no"));
				cart.setMemberNo(rs.getInt("member_no"));
				cart.setProductNo(rs.getInt("product_no"));
				cart.setCount(rs.getInt("count"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]select cm_cart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cart;
	}
	
	public List<CartDTO> selectCartList(int memberNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CartDTO> cartList=new ArrayList<CartDTO>();
		try {
			con=getConnection();
			
			//String sql="select * from student where name=? order by no";
			String sql="select c.no, c.member_no, c.product_no, c.count, p.price, p.category, p.name, p.thumbnail from cm_cart c left JOIN cm_product p ON c.product_no= p.no where member_no = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs=pstmt.executeQuery();
			
			//검색행이 있는 경우 반복 처리
			// => DTO 인스턴스를 생성하여 검색행의 컬럼값을 반환받아 DTO 인스턴스의 필드값으로 변경
			// => DTO 인스턴스를 List 인스턴스의 요소로 추가
			while(rs.next()) {
				CartDTO cart=new CartDTO();
				cart.setNo(rs.getInt("no"));
				cart.setMemberNo(rs.getInt("member_no"));
				cart.setProductNo(rs.getInt("product_no"));
				cart.setCount(rs.getInt("count"));
				cart.setPrice(rs.getInt("price"));
				cart.setName(rs.getString("name"));
				cart.setCategory(rs.getString("category"));
				cart.setThumbnail(rs.getString("thumbnail"));
				cartList.add(cart);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCartList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cartList;
	}
	
}
