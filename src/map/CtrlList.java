package map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.RequestMapping;


@RequestMapping("/index.do")
public class CtrlList implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String l = null;
		
        MapDAO dao = new MapDAO_OracleImpl();
        List<MapVO> rl = dao.findAll();

        String search_place= request.getParameter("search_place");
        request.setAttribute("rl", rl);
        

		System.out.println("ControllerList TEST" + rl.toString());
		return "/index.jsp";
	}

}
