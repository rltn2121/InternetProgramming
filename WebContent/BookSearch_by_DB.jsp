<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" errorPage="DBError.jsp"%>
<%@page import="java.sql.*"%>

<html>
<head>

<Title>�˻� ���</Title>
<link href="Style.css" type="text/css" rel="stylesheet">
</head>
<body>

	<h1>�˻� ���</h1>
	<div>
		<table align = center>
			<tr>
				<th>�ڵ�</th>
				<th>����</th>
				<th>����</th>
				<th>����</th>
			</tr>
			<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/booklist", "root", "5ab5c87a");

					if (conn == null)
						throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.<br>");
					stmt = conn.createStatement();
					String data = request.getParameter("DATA");
					String type = request.getParameter("TYPE");
						if (type.equals("title")) {
						rs = stmt.executeQuery("select * from goodsinfo where title LIKE " + "\"%" + data + "%\";");
					} else
						rs = stmt.executeQuery("select * from goodsinfo where writer LIKE " + "\"%" + data + "%\";");
					while (rs.next()) {
						String state = "X";
						String code = rs.getString("code");
						String title = rs.getString("title");
						String writer = rs.getString("writer");
						int available = rs.getInt("available");
						if (available == 1) {
							state = "O";
						}
			%>
			<tr>
				<form action = BorrowReturn.jsp METHOD = POST>
				<td>&nbsp;&nbsp;<%=code%>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<%=title%>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<%=writer%>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<%=state%>&nbsp;&nbsp;</td>
				<input type = hidden name = TITLE value = "<%=title%>">
				<input type = hidden name = STATE value = "<%=state%>">
				<td><input type=submit value="����" name = BORROW></td>
				<td><input type=submit value="�ݳ�" name = RETURN></td>
				</form>
			</tr>
			<%
				}
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
				}
			%>

		</table>
	</div>
</body>
</html>