package com.alifmunim;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/Processinfo")
public class Processinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Processinfo() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/DisplayInfo.jsp";
		String fName = request.getParameter("fname");
		String lName = request.getParameter("lname");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		
		if(!regexChecker("^[A-Za-z\\.\\' \\-]{2,30}$", fName)) {
			url = "/index.jsp";
			fName = "Try Again";
		}
		
		if(!regexChecker("^[A-Za-z\\.\\' \\-]{2,30}$", lName)) {
			url = "/index.jsp";
			lName = "Try Again";
		}
		
		if(!regexChecker("^[A-Za-z0-9\\.\\' \\-]{5,50}$", street)) {
			url = "/index.jsp";
			street = "Try Again";
		}
		
		if(!regexChecker("^[A-Za-z\\.\\' \\-]{5,30}$", city)) {
			url = "/index.jsp";
			city = "Try Again";
		}
		
		if(!regexChecker("^(?:(A[KLRZ]|C[AOT]|D[CE]|FL|GA|HI|I[ADLN]|K[SY]|LA|"
				+ "M[ADEINOST]|N[CDEHJMVY]|O[HKR]|P[AR]|RI|S[CD]|"
				+ "T[NX]|UT|V[AIT]|W[AIVY]))$", state)) {
			url = "/index.jsp";
			state = "Try Again";
		}
		
		if(!regexChecker("^[0-9\\-]{5,10}$", zipcode)) {
			url = "/index.jsp";
			zipcode = "Try Again";
		}
		
		if(!regexChecker("^[A-Za-z0-9._\\%-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", email)) {
			url = "/index.jsp";
			email = "Try Again";
		}
		
		// Must have 1 uppercase, 1 lowercase, 1 number, and a special
		if(!regexChecker("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,20}$", password)) {
			url = "/index.jsp";
			password = "Try Again";
		}
		
		if(!regexChecker("^([0-9]( |-)?)?(\\(?[0-9]{3}\\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[0-9]{7})$", phone)) {
			url = "/index.jsp";
			phone = "Try Again";
		}
		
		if(!url.equals("/index.jsp")) {
			updateDB(fName, lName, street, city,
					state, zipcode, email, password, phone);
		}
		
		
		
		
		Customer cust = new Customer(fName, lName, street, city,
				state, zipcode, email, password, phone);
				
		request.setAttribute("cust", cust);
		getServletContext()
		.getRequestDispatcher(url)
		.forward(request, response);
	}

	protected void updateDB(String fName, String lName, String street,
			String city, String state, String zipcode, String email, 
			String password, String phone) {
		Connection con;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/test2";
			String user = "dbadmin";
			String pw = "turtledove";
			con = DriverManager.getConnection(url, user, pw);
			Statement s = con.createStatement();
			String query = "INSERT INTO CUSTOMER " + 
					"(fname, lname, street, city, state," +
					" zipcode, email, password, phone, cust_id) " +
					"VALUES ('" + fName + "', '" + lName + "', '" +
					street + "', '" + city + "', '" + state + "', '" +
					zipcode + "', '" + email + "', '" + password + "', '" +
					phone + "', NULL)"; 
			s.executeUpdate(query);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	static boolean regexChecker(String theRegex, String str2Check) {
		Pattern regexPattern = Pattern.compile(theRegex);
		Matcher regexMatcher = regexPattern.matcher(str2Check);
		if(regexMatcher.matches()) {
			return true;
		} else {
			return false;
		}
	}
	
}
