package com.ibm.crud.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.crud.dao.UserDao;
import com.ibm.crud.model.User;

/**
 * Servlet implementation class AuthenticationController
 */
@WebServlet(description = "User's Validation (login and password)", urlPatterns = { "/authentication/login" })
public class AuthenticationController extends HttpServlet {
	private static final long serialVersionUID = -717103814686488261L;

	// Constants that helps in this Controller
	private final String ERROR 			= "/views/error/error.jsp";
	private final String LOGIN_FAILED 	= "/views/authentication/loginFailed.jsp";
	private final String REDIRECT 		= "/views/authentication/redirect.jsp";

	// UserDao, it will help to work on MySQL.
	private UserDao userDao = new UserDao();

	/**
	 * Constructor default, <code>com.ibm.crud.controller.AuthenticationController</code>
     * @see HttpServlet#HttpServlet()
     */
    public AuthenticationController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Getting login and password from request
		final String LOGIN = (String) request.getParameter("login");
		final String PASSWORD = (String) request.getParameter("password");

		// Next JSP that will be forwarded
		String nextJSP = null;

		// User that will be put on session
		User user = null;

		// Let's try to validate login and password
		try {
			// Getting the user based login and password by request
			user = userDao.retrieve(LOGIN);

			// If user is null, go back and alert the user
			if(null == user) {
				// Go to login failed
				nextJSP = LOGIN_FAILED;
			}

			// If user is NOT null, go ahead
			if(null != user) {
				// Check the user's password
				if(!PASSWORD.equals(user.getPassword())) {
					// Go to login failed
					nextJSP = LOGIN_FAILED;
				}
			}
			// Let's the save user in session because we will 
			// use it on the future
			HttpSession session = request.getSession(true);
			session.setAttribute("currentUser", user);
			
		// If appears any issues, let's show it for our users from this web app
		} catch (Exception e) {
			e.printStackTrace();
			getServletContext().getRequestDispatcher(ERROR).forward(request, response);
		}

		// Redirect the page...
		getServletContext().getRequestDispatcher((null == nextJSP) ? REDIRECT : nextJSP).forward(request, response);
	}
}