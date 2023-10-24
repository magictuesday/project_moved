package human.dao;
import human.vo.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ClientDao {
	public static String user = "jsp";
	public static String passwd = "123456";
	public static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	public static Connection conn = null;
	public static Statement stmt = null;
	public static PreparedStatement pstmt = null;
	public static PreparedStatement pstmt2 = null;
	public static ResultSet rs = null;
	
	public void getConnect() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, passwd);			
		}catch(Exception e) {
			System.out.println("오라클 접속 에러: " + e.getMessage());
		}
	}
	
	public void closeConn() {
		try {
			if(conn!=null) conn.close();
			if(stmt!=null) stmt.close();
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(pstmt2!=null) pstmt2.close();
		}catch(SQLException se) {
			System.out.println("오라클 접속 해제 : " + se.getMessage());
		}
	}
	
	// 게시판 전체 목록 가져오기
	public ArrayList<ClientVo> getBoardListAll(String curPage) {
		
		System.out.println("게시판 전체 목록 가져오기");
		
		ArrayList<ClientVo> clientList = new ArrayList<ClientVo>();
		
		getConnect();
		
		try {
			String sql = "SELECT rownum rn , c.* FROM client c";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ClientVo tempvo = new ClientVo();
				System.out.print(rs.getString("m_date"));
				
				tempvo.setRn(rs.getInt("rn"));
				tempvo.setOderno(rs.getString("order_no"));
				tempvo.setName(rs.getString("name"));
				tempvo.setMdate(rs.getString("m_date"));

				tempvo.setOrigin(rs.getString("origin"));
				tempvo.setDestin( rs.getString("destin"));
				tempvo.setCost( rs.getInt("cost"));
				tempvo.setProcess( rs.getString("process"));
				
				clientList.add(tempvo);
			}	
		}catch(SQLException se) {
			System.out.println("getBoardListAll 쿼리에러:" + se.getMessage());		
		}
		
		closeConn();
		
		return clientList;
	}
	
//	고객 처리 미처리 업데이트
	
	public int updateProcess(String oderno, String process) {
	    getConnect();

	    try {
	        String sql = "UPDATE client SET process = ? WHERE ORDER_NO = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, process);
	        pstmt.setString(2, oderno);

	       
	        int rowsUpdate = pstmt.executeUpdate();
	        return rowsUpdate;
	    } catch (SQLException se) {
	        System.out.println("updateProcess 쿼리 오류: " + se.getMessage());
	        return 0;
	    } finally {
	        closeConn();
	    }
	}
	// 신청현황 총 신청
	public int getClientCount() {
		
		System.out.println("총원 수를 가져옴");
		int rst = 0;
		
		getConnect();
		try {
			String sql = "SELECT COUNT(*) AS CNT FROM client";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst = rs.getInt("CNT");
			}
		}catch(SQLException se) {
			System.out.println("getClientCount 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		return rst;
	}
	// 신청현황 진행중
	public int getClientingCount() {
		
		System.out.println("진행중 수를 가져옴");
		int rst = 0;
		
		getConnect();
		try {
			String sql = "SELECT COUNT(*) AS counting FROM client WHERE process IN ('업체전달', '고객전달', '미처리')";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst = rs.getInt("counting");
			}
		}catch(SQLException se) {
			System.out.println("getClientingCount 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		return rst;
	}
	// 신청현황 완료
	public int getClientproCount() {
		
		System.out.println("완료 수를 가져옴");
		int rst = 0;
		
		getConnect();
		try {
			String sql = "SELECT COUNT(*) AS cltpro FROM client WHERE process IN ('처리')";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst = rs.getInt("cltpro");
			}
		}catch(SQLException se) {
			System.out.println("getClientproCount 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		return rst;
	}
}

















