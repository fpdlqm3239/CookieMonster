package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.CartDTO;
import xyz.itwill.dto.OrderDTO;

public class OrderDAO extends JdbcDAO {
private  static OrderDAO _dao;
	
	private OrderDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new OrderDAO();
	}
	
	public static OrderDAO getDAO() {
		return _dao;
	}
	
	public int insertOrder(OrderDTO order) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;//SQL 명령의 실행 결과를 저장하기 위한 변수
		try {
			con=getConnection();
			
			String sql="insert into cm_order values (?, ?, SYSDATE,? , ?,'우체국',  ?, ?, ?, ?, ?, ?)";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, order.getNo());
			pstmt.setInt(2, order.getMemberNo());
			pstmt.setString(3, order.getPhone());
			pstmt.setString(4, order.getStatus());
			pstmt.setString(5, order.getMainAddress());
			pstmt.setString(6, order.getDetailAddress());
			pstmt.setString(7, order.getZipcode());
			pstmt.setString(8, "100");		
			pstmt.setString(9, order.getReceiverName());
			pstmt.setString(10, order.getTotalPrice());
			
			/*
			int no;
			int memberNo;
			private String date;
			private String phone;
			int status;
			private String courier;
			private String mainAddress;
			private String detailAddress;
			private String zipCode;
			private String invoice;
			 */
			
			System.out.println(sql);
			rows=pstmt.executeUpdate();
			System.out.println(rows);
			
		} catch (SQLException e) {
			System.out.println("[에러]insertcm_Order() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public int updateOrder(OrderDTO order) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			
			String sql="update cm_Order set memberNo=?,date=?,phone=?,status=?,courier=?,mainAddress=?,detailAddress=?,zipCode=?,invoice=?, totalPrice=?, where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, order.getNo());
			pstmt.setInt(2, order.getMemberNo());
			pstmt.setString(3, order.getDate());
			pstmt.setString(4, order.getPhone());
			pstmt.setString(5, order.getStatus());
			pstmt.setString(6, order.getCourier());
			pstmt.setString(7, order.getMainAddress());
			pstmt.setString(8, order.getDetailAddress());
			pstmt.setString(9, order.getZipcode());
			pstmt.setString(10, order.getInvoice());
			pstmt.setString(11, order.getTotalPrice());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]update cm_Order() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int updateStatus(String orderNo, String status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="update cm_order set status=? where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setString(2, orderNo);

			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//학번을 전달받아 STUDENT 테이블에 저장된 학생정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
		public int deleteOrder(int memberNo) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="delete from cm_order where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]delete cm_order() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
	public OrderDTO selectOrder(int orderNo) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			OrderDTO order=null;
			try {
				con=getConnection();
				
				String sql="select * from cm_order where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, orderNo);
				rs=pstmt.executeQuery();
				//검색행이 있는 경우 DTO 인스턴스 생성하고 검색행의 컬럼값을 반환받아 
				//DTO 인스턴스의 필드값으로 변경
				if(rs.next()) {
					//DTO 인스턴스 생성 - 인스턴스 필드에는 기본값 저장 
					order=new OrderDTO();
					//검색행의 컬럼값을 DTO 인스턴스의 필드값으로 매핑 처리(Oracle >> Java)
					order.setNo(rs.getInt("no"));
					order.setMemberNo(rs.getInt("member_no"));
					order.setDate(rs.getString("date"));
					order.setPhone(rs.getString("phone"));
					order.setStatus(rs.getString("status"));
					order.setCourier(rs.getString("courier"));
					order.setMainAddress(rs.getString("main_address"));
					order.setDetailAddress(rs.getString("detail_address"));
					order.setInvoice(rs.getString("invoice"));
					order.setReceiverName(rs.getString("receiver_name"));
					order.setZipcode(rs.getString("zipcode"));
					order.setTotalPrice(rs.getString("total_price"));
				}
			} catch (SQLException e) {
				System.out.println("[에러]select cm_order() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			//검색행이 없는 경우 null 반환,검색행이 있는 경우 DTO 인스턴스 반환
			return order;
		}
	
	public List<OrderDTO> selectAllOrder() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from cm_order order by \"date\" desc";
			pstmt=con.prepareStatement(sql);	
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				order.setNo(rs.getInt("no"));
				order.setMemberNo(rs.getInt("member_no"));
				order.setDate(rs.getString("date"));
				order.setPhone(rs.getString("phone"));
				order.setStatus(rs.getString("status"));
				order.setCourier(rs.getString("courier"));
				order.setMainAddress(rs.getString("main_address"));
				order.setDetailAddress(rs.getString("detail_address"));
				order.setInvoice(rs.getString("invoice"));
				order.setTotalPrice(rs.getString("total_price"));
				orderList.add(order);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllOrder() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	
	public int selectOrderSeq() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int orderSeq = 0;
		try {
			con=getConnection();
			
			String sql="SELECT CM_ORDER_SEQ.nextval as nextval FROM dual";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			//검색행이 있는 경우 DTO 인스턴스 생성하고 검색행의 컬럼값을 반환받아 
			//DTO 인스턴스의 필드값으로 변경
			if(rs.next()) {
				orderSeq = rs.getInt("nextval");
			}
		} catch (SQLException e) {
			System.out.println("[에러]select cm_order() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		//검색행이 없는 경우 null 반환,검색행이 있는 경우 DTO 인스턴스 반환
		return orderSeq;
	}
	
		
		public List<OrderDTO> selectOrderList(int memberNo) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<OrderDTO> orderList=new ArrayList<OrderDTO>();
			try {
				con=getConnection();
			
				//String sql="select * from student where name=? order by no";
				String sql="select * from cm_order where member_no = ? ";
				System.out.println(sql);
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
				//pstmt.setString(1, name);
			
				rs=pstmt.executeQuery();
			
				//검색행이 있는 경우 반복 처리
				// => DTO 인스턴스를 생성하여 검색행의 컬럼값을 반환받아 DTO 인스턴스의 필드값으로 변경
				// => DTO 인스턴스를 List 인스턴스의 요소로 추가
				while(rs.next()) {
					OrderDTO order=new OrderDTO();
					order.setNo(rs.getInt("no"));
					order.setMemberNo(rs.getInt("member_no"));
					order.setDate(rs.getString("date"));
					order.setPhone(rs.getString("phone"));
					order.setStatus(rs.getString("status"));
					order.setCourier(rs.getString("courier"));
					order.setMainAddress(rs.getString("main_address"));
					order.setDetailAddress(rs.getString("detail_address"));
					order.setInvoice(rs.getString("invoice"));
					order.setReceiverName(rs.getString("receiver_name"));
					order.setTotalPrice(rs.getString("total_price"));
					orderList.add(order);
				}
			} catch (SQLException e) {
				System.out.println("[에러]orderList() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return orderList;
		}
		
}
