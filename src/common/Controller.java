package common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface Controller {
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
