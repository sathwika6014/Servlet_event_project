package eventapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
@WebServlet(urlPatterns = "/update")
public class UpdateServlet extends HttpServlet {
	public void service(ServletRequest req,ServletResponse res) throws ServletException, IOException{
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		String title = req.getParameter("title");
		System.out.println(title);
		String loc = req.getParameter("loc");
		System.out.println(loc);
		String date = req.getParameter("date");
		System.out.println(date);
		String guest = req.getParameter("guest");
		System.out.println(guest);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management_system", "root", "root");
			PreparedStatement ps=con.prepareStatement("update event set title=?,loc=?,date=?,guest=? where id=?");
			ps.setString(1, title);
			ps.setString(2,  loc);
			ps.setString(3, date);
			ps.setString(4, guest);
			ps.setInt(5, id);
			int row=ps.executeUpdate();
			PrintWriter pw=res.getWriter();
			pw.write("<html><body><h3>Event Updated Successfully</h3></body></html>");
			RequestDispatcher rd=req.getRequestDispatcher("all");
			rd.include(req, res);
			ps.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
