package com.ibm.crud.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.ibm.crud.dao.UserDao;
import com.ibm.crud.model.User;

/**
 * Servlet implementation class UserController, this controller will have these
 * actions:<br>
 * <br>
 * 
 * /user/summary<br>
 * /user/add<br>
 * /user/save<br>
 * /user/edit<br>
 * /user/update<br>
 * /user/delete<br>
 * /user/trash<br>
 * 
 * @see org.apache.log4j.Logger
 * @see javax.servlet.http.HttpServlet;
 * @see javax.servlet.http.HttpServletRequest
 * @see javax.servlet.http.HttpServletResponse
 */
public class UserController extends HttpServlet {
	private static final long serialVersionUID = -5841956902123737860L;

	

	// Constants that helps in this Controller
	private final String ERROR = "/views/error/error.jsp";
	private final String ADD = "/views/user/add.jsp";
	private final String LIST = "/views/user/summary.jsp";
	private final String EDIT = "/views/user/edit.jsp";
	private final String DELETE = "/views/user/delete.jsp";
	
	/**
	 * UserController's Logger.
	 */
	private static Logger logger = Logger.getLogger(UserController.class);

	/**
	 * UserDao.
	 */
	private UserDao userDao = new UserDao();

	/**
	 * Default constructor, <code>com.ibm.crud.controller.UserController</code>.
	 */
	public UserController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.info("UserController.doGet's called!");
		this.execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.info("UserController.doPost's called!");
		this.execute(request, response);
	}

	/**
	 * @return String - Next JSTP that will be redirected
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String ACTION = request.getParameter("action");
		if ("".equalsIgnoreCase(ACTION)) {
			logger.warn("");
		} else if ("ADD".equalsIgnoreCase(ACTION)) {
			logger.info("Action:[" + ACTION + "...]");
			add(request, response);
		} else if ("SUMMARY".equalsIgnoreCase(ACTION) || "LIST".equalsIgnoreCase(ACTION)) {
			logger.info("Action:[" + ACTION + "...]");
			list(request, response);
		} else if ("SAVE".equalsIgnoreCase(ACTION)) {
			logger.info("Action:[" + ACTION + "...]");
			save(request, response);
		} else if ("EDIT".equalsIgnoreCase(ACTION)) {
			logger.info("Action:[" + ACTION + "...]");
			edit(request, response);
		} else if ("UPDATE".equalsIgnoreCase(ACTION)) {
			logger.info("Action:[" + ACTION + "...]");
			update(request, response);
		} else if ("DELETE".equalsIgnoreCase(ACTION)) {
			logger.info("Action:[" + ACTION + "...]");
			delete(request, response);
		}else if ("TRASH".equalsIgnoreCase(ACTION)) {
			logger.info("Action:[" + ACTION + "...]");
			trash(request, response);
		}
	}

	/**
	 * add(HttpServletRequest, HttpServletResponse)
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Redirect the page...
		getServletContext().getRequestDispatcher(ADD).forward(request, response);
	}

	/**
	 * list(HttpServletRequest, HttpServletResponse)
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// List of User
			List<User> users = userDao.list();
			// Let's put user into request
			request.setAttribute("users", users);

			// If appears any issues, let's show it for our users from this web
			// app
		} catch (Exception e) {
			e.printStackTrace();
			getServletContext().getRequestDispatcher(ERROR).forward(request, response);
		}

		// Redirect the page...
		getServletContext().getRequestDispatcher(LIST).forward(request, response);
	}

	/**
	 * save(HttpServletRequest, HttpServletResponse)
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			final String LOGIN = request.getParameter("login");
			final String PASSWORD = request.getParameter("password");

			User user = new User();
			user.setPassword(PASSWORD);
			user.setLogin(LOGIN);
			userDao.insert(user);

			request.setAttribute("userUpdated", user);
			request.setAttribute("users", userDao.list());
			// If appears any issues, let's show it for our users from this web
			// app
		} catch (Exception e) {
			e.printStackTrace();
			getServletContext().getRequestDispatcher(ERROR).forward(request, response);
		}

		// Redirect the page...
		getServletContext().getRequestDispatcher(LIST).forward(request, response);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			final String LOGIN = request.getParameter("login");

			User user = userDao.retrieve(LOGIN);
			request.setAttribute("userEdit", user);
			// If appears any issues, let's show it for our users from this web
			// app
		} catch (Exception e) {
			e.printStackTrace();
			getServletContext().getRequestDispatcher(ERROR).forward(request, response);
		}

		// Redirect the page...
		getServletContext().getRequestDispatcher(EDIT).forward(request, response);
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			final int ID = Integer.parseInt(request.getParameter("id"));
			final String LOGIN = request.getParameter("login");
			final String PASSWORD = request.getParameter("password");

			User user = new User();
			user.setId(ID);
			user.setPassword(PASSWORD);
			user.setLogin(LOGIN);
			userDao.update(user);

			request.setAttribute("userUpdated", user);
			request.setAttribute("users", userDao.list());
		} catch (Exception e) {
			e.printStackTrace();
			getServletContext().getRequestDispatcher(ERROR).forward(request, response);
		}

		// Redirect the page...
		getServletContext().getRequestDispatcher(LIST).forward(request, response);
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			final String LOGIN = request.getParameter("login");
			User user = userDao.retrieve(LOGIN);
			request.setAttribute("userDelete", user);
		} catch (Exception e) {
			e.printStackTrace();
			getServletContext().getRequestDispatcher(ERROR).forward(request, response);
		}

		// Redirect the page...
		getServletContext().getRequestDispatcher(DELETE).forward(request, response);
	}
	
	private void trash(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			final int ID = Integer.parseInt(request.getParameter("id"));
			final String LOGIN = request.getParameter("login");
			
			User userTrash = userDao.retrieve(LOGIN);
			int rowsAffected = userDao.delete(ID);
			
			request.setAttribute("userTrash", userTrash);
			request.setAttribute("rowsAffected", rowsAffected);
			request.setAttribute("users", userDao.list());
		} catch (Exception e) {
			e.printStackTrace();
			getServletContext().getRequestDispatcher(ERROR).forward(request, response);
		}

		// Redirect the page...
		getServletContext().getRequestDispatcher(LIST).forward(request, response);
	}
	
}