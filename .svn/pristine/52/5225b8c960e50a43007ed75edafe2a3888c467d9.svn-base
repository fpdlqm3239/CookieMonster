package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.CartDTO;
import xyz.itwill.dto.OrderDTO;
import xyz.itwill.dto.OrderProductDTO;
import xyz.itwill.dto.ProductDTO;

public class OrderProductDAO extends JdbcDAO {
private  static OrderProductDAO _dao;
	
	private OrderProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new OrderProductDAO();
	}
	
	public static OrderProductDAO getDAO() {
		return _dao;
	}
	
	public int insertOrderProduct(OrderProductDTO order) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;//SQL 명령의 실행 결과를 저장하기 위한 변수
		try {
			con=getConnection();
			
			String sql="insert into cm_order_product values (CM_ORDER_PRODUCT_SEQ.NEXTVAL, ? ,? , ?)";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, order.getOrderNo());
			pstmt.setInt(2, order.getProductNo());
			pstmt.setInt(3, order.getCount());
			
			System.out.println(sql);
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertcm_Order() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public List<OrderProductDTO> selectOrderProdList(int orderNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderProductDTO> orderProdList=new ArrayList<OrderProductDTO>();
		try {
			con=getConnection();
			String sql="SELECT "
					+ "order_prod.no as no"
					+ ",order_prod.order_no as order_no"
					+ ",order_prod.product_no as product_no"
					+ ",order_prod.count  as count"
					+ ",prod.price as price"
					+ ",prod.name as name"
					+ ",prod.category as category"
					+ ",temp.member_no as member_no"
					+ ",temp.\"date\" as test"
					+ ",temp.phone as phone"
					+ ",temp.status as status"
					+ ",temp.main_address as main_address"
					+ ",temp.detail_address as detail_address "
					+ ",temp.receiver_name as receiver_name "
					+ ",temp.total_price as total_price "
					+ ",temp.zipcode as zipcode "
					+ "FROM "
					+ "cm_order_product order_prod "
					+ "left join cm_product prod on order_prod.product_no=prod.no "
					+ "left join cm_order temp on order_prod.order_no=temp.no "
					+ "where order_prod.order_no=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderProductDTO orderProd=new OrderProductDTO();
				OrderDTO order=new OrderDTO();
				ProductDTO product=new ProductDTO();
				orderProd.setNo(rs.getInt("no"));
				orderProd.setCount(rs.getInt("count"));
				product.setNo(rs.getInt("product_no"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setCategory(rs.getString("category"));
				order.setMemberNo(rs.getInt("member_no"));
				order.setStatus(rs.getString("status"));
				order.setMainAddress(rs.getString("main_address"));
				order.setDetailAddress(rs.getString("detail_address"));
				order.setReceiverName(rs.getString("receiver_name"));
				order.setTotalPrice(rs.getString("total_price"));
				order.setZipcode(rs.getString("zipcode"));
				order.setPhone(rs.getString("phone"));
				orderProd.setOrder(order);
				orderProd.setProductDTO(product);
				orderProdList.add(orderProd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return orderProdList;
	}
}
