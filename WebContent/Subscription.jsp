<%@page contentType="text/html; charset=euc-kr" errorPage="DBError.jsp" %>
<%@page import="java.sql.*"%>
<%
		String id = request.getParameter("ID");
		String pw = request.getParameter("PW");
		String name = request.getParameter("NAME");
		String email = request.getParameter("EMAIL");
		String bd = request.getParameter("BD");
		String gender = request.getParameter("GENDER");
		

		if (id == null || pw == null || name == null )
			throw new Exception("�����͸� �Է��ϼ���.");
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userlist", "root", "5ab5c87a");
			if (conn == null)
				throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
			stmt = conn.createStatement();
			String command = String.format(
					"insert into userinfo "
							+ "(id, pw, name, email, bd, gender) values ('%s','%s','%s','%s','%s', '%s');",
					id, pw, name, email, bd, gender);
			int rowNum = stmt.executeUpdate(command);
			if (rowNum < 1)
				throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�.");
		}
		catch(Exception e)
		{
			throw new Exception("�̹� �����ϴ� ���̵��Դϴ�.");
		}
		finally {
			try {
				stmt.close();
			} catch (Exception ignored) {
			}
			try {
				conn.close();
			} catch (Exception ignored) {

			}
		}
		response.sendRedirect("Subscription_Result.jsp");
	%>
	
