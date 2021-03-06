package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.ProductDTO;
import xyz.itwill.dto.ProductSearchDTO;
import xyz.itwill.enums.EProductCategory;
import xyz.itwill.enums.EProductSelect;

public class ProductDAO extends JdbcDAO {
	private static ProductDAO _dao;
	
	private ProductDAO() {
	}
	
	static {
		_dao = new ProductDAO();
	}
	
	public static ProductDAO getDAO() {
		return _dao;
	}
	
	public int insertProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql=
					"insert into cm_product values(cm_product_seq.nextval,?,?,?,?,?,?,?,sysdate)";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, product.getPrice());
			pstmt.setInt(2, product.getCount());		
			pstmt.setString(3, product.getCategory().toLowerCase());
			pstmt.setString(4, product.getName());
			pstmt.setString(5, product.getThumbnail());
			pstmt.setString(6, product.getDescription());
			pstmt.setInt(7, product.getRecommand());
						
			rows=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("[에러]insertProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows; 
	}
	
	public ProductDTO selectProductByNo(String no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDTO product=null;
		try {
			con=getConnection();
			
			String sql = "select * from cm_product where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				product=new ProductDTO();
				product.setNo(rs.getInt("no"));
				product.setPrice(rs.getInt("price"));
				product.setCount(rs.getInt("count"));
				product.setCategory(rs.getString("category"));
				product.setName(rs.getString("name"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));

				product.setRecommand(rs.getInt("recommand"));
				product.setReceivingDate(rs.getString("receiving_date"));			
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
	
	public ProductDTO selectProductByName(String name) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDTO product=null;
		try {
			con=getConnection();
			
			String sql = "select * from cm_product where name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				product=new ProductDTO();
				product.setNo(rs.getInt("no"));
				product.setPrice(rs.getInt("price"));
				product.setCount(rs.getInt("count"));
				product.setCategory(rs.getString("category"));
				product.setName(rs.getString("name"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));

				product.setRecommand(rs.getInt("recommand"));
				product.setReceivingDate(rs.getString("receiving_date"));			
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
	
	public List<ProductDTO> selectProductListByKeyword(String keyword,int startRow, int endRow) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			
			String sql="select * from (select rownum rn, temp.* from (select * from cm_product where name like '%'||?||'%' order by no) temp) where rn between ? and ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setNo(rs.getInt("no"));
				product.setPrice(rs.getInt("price"));
				product.setCount(rs.getInt("count"));
				product.setCategory(rs.getString("category"));
				product.setName(rs.getString("name"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setRecommand(rs.getInt("recommand"));
				product.setReceivingDate(rs.getString("receiving_date"));
				
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProductListByKeyword() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs); 
		}
		return productList;
	}
	
	public List<ProductDTO> selectAllProductList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			
			String sql="select * from cm_product order by no";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setNo(rs.getInt("no"));
				product.setPrice(rs.getInt("price"));
				product.setCount(rs.getInt("count"));
				product.setCategory(rs.getString("category"));
				product.setName(rs.getString("name"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setRecommand(rs.getInt("recommand"));
				product.setReceivingDate(rs.getString("receiving_date"));
				
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllProductList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs); 
		}
		return productList;
	}
	
	public List<ProductDTO> selectProductList(EProductSelect type) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			String sql = "";
			

			switch (type) {
			case RECOMMAND:
				sql="select * from cm_product where recommand = 1 order by no";
				break;
			case RECEIVING_DATE:
				sql="select * from cm_product where (sysdate - to_date(receiving_date)) < 2 order by no";				
				break;
			default:
				break;
			}
			
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setNo(rs.getInt("no"));
				product.setPrice(rs.getInt("price"));
				product.setCount(rs.getInt("count"));
				product.setCategory(rs.getString("category"));
				product.setName(rs.getString("name"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setRecommand(rs.getInt("recommand"));
				product.setReceivingDate(rs.getString("receiving_date"));
				
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllProductList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs); 
		}
		return productList;
	}
	
	public List<ProductDTO> selectProductList(EProductCategory type) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			String sql = "";
			switch (type) {
			case ALL:
				sql="select * from cm_product";
				break;
			case SUNGLASS:
			case GLASSES:
			case TEST:
				sql="select * from cm_product where category = lower('"
						+ type.toString()
						+ "') order by no";				
				break;
			default:
				break;
			}
			
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setNo(rs.getInt("no"));
				product.setPrice(rs.getInt("price"));
				product.setCount(rs.getInt("count"));
				product.setCategory(rs.getString("category"));
				product.setName(rs.getString("name"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setRecommand(rs.getInt("recommand"));
				product.setReceivingDate(rs.getString("receiving_date"));
				
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProductList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs); 
		}
		return productList;
	}
	
	public List<ProductDTO> selectProductList(ProductSearchDTO searchDTO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			String sql = "select * from cm_product ";
			
			if(searchDTO.isSomethingSearch()) {
				sql += "where ";
			}
			
			sql = searchDTO.makeSqlCategory(sql);
			sql = searchDTO.makeSqlSelect(sql);
			
			if(!searchDTO.searchBlank()) {
				sql = searchDTO.makeSqlDuplicateCondition(sql);
				sql += "name like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);	
				pstmt.setString(1, searchDTO.getSearch());	
			}
			else {
				pstmt=con.prepareStatement(sql);	
			}

			//System.out.println(sql);
			rs=pstmt.executeQuery();
			
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setNo(rs.getInt("no"));
				product.setPrice(rs.getInt("price"));
				product.setCount(rs.getInt("count"));
				product.setCategory(rs.getString("category"));
				product.setName(rs.getString("name"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setRecommand(rs.getInt("recommand"));
				product.setReceivingDate(rs.getString("receiving_date"));
				
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProductList(ProductSearchDTO) 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs); 
		}
		return productList;
	}
	
	public int updateProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql=
					"update cm_product set price=?,count=?,category=?,name=?,thumbnail=?,description=?,recommand=? where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, product.getPrice());
			pstmt.setInt(2, product.getCount());
			pstmt.setString(3, product.getCategory().toLowerCase());
			pstmt.setString(4, product.getName());
			pstmt.setString(5, product.getThumbnail());
			pstmt.setString(6, product.getDescription());
			pstmt.setInt(7, product.getRecommand());
			pstmt.setInt(8, product.getNo());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows; 
	}
	
	public int deleteProduct(int no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from cm_product where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows; 
	}
	
	
	public int selectProductCount(EProductCategory type) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count = 0;
		try {
			con=getConnection();
			String sql = "";
			if(type.equals("ALL")) {
				 sql="select count(*) from cm_product";
				 pstmt = con.prepareStatement(sql);
				
			}else{
				sql = "select count(*) from cm_product where category = lower(?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, type.toString());
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		
		} catch (SQLException e) {
			System.out.println("[에러]selectProductCount() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs); 
		}
		return count;
	}
	
	
	
	public List<ProductDTO> selectProductList(EProductCategory type, int startRow, int endRow) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			String sql = "";
			switch (type) {
			case ALL:
				sql="select * from (select rownum rn, temp.* from (select * from cm_product order by no) temp) where rn between ? and ?";
				break;
			case SUNGLASS:
				sql="select * from (select rownum rn, temp.* from (select * from cm_product where category = lower('" +type.toString()+"') order by no) temp) where rn between ? and ?";
				break;
			case GLASSES:
				sql="select * from (select rownum rn, temp.* from (select * from cm_product where category = lower('" +type.toString()+"') order by no) temp) where rn between ? and ?";
				break;
			default:
				break;
			}
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setNo(rs.getInt("no"));
				product.setPrice(rs.getInt("price"));
				product.setCount(rs.getInt("count"));
				product.setCategory(rs.getString("category"));
				product.setName(rs.getString("name"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setRecommand(rs.getInt("recommand"));
				product.setReceivingDate(rs.getString("receiving_date"));
				
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProductList(3) 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs); 
		}
		return productList;
	}
	
}