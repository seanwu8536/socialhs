<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@203.236.209.182:1521:xe";
	final String USER = "SOCIALHS";
	final String PASSWORD = "socialhs";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 화면</title>
</head>
<body>
<%
			Connection conn = null;	
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				//1. 드라이버 로딩
				Class.forName(DRIVER);
				//2. DB연결(Connection)
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
				//3. Statement 객체 생성
				String sql = "";
				sql += "SELECT U_IDX, NAME, ID, PW, AGE ";
				sql += "  FROM MEMBER ";
				sql += " ORDER BY U_IDX ";
				pstmt = conn.prepareStatement(sql);
				//4. SQL문 실행
				rs = pstmt.executeQuery();
				//5. SQL문 실행결과에 대한 처리
				while (rs.next()) {
%>
				
				<%=rs.getInt(1) %><br>
				<%=rs.getString(2) %><br>
				<%=rs.getString(3) %><br>
				<%=rs.getString(4) %><br>
				<%=rs.getInt(5) %><br>
<%					
				}
			} catch (Exception e) {
				out.println("<h2>[예외발생]담당자(8282)전화연락</h2>");
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn != null) conn.close();
				} catch (Exception e) {}
			}
%>							
</body>
</html>