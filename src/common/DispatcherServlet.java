package common;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;

public class DispatcherServlet extends HttpServlet {

    private Map<String, Controller> mapp = null;

    @Override
    public void init(ServletConfig config) throws ServletException {
       mapp = new Hashtable<String, Controller>();
     //String cs = "mvc.ControllerList,mvc.ControllerAdd2";
       String cs = config.getInitParameter("controllers");
       
       String[] cs2 = cs.split(",");
     //for(String cls : cs.split(","))
       for(int i=0; i<cs2.length; i++){
           try{
               Class<?> cls = Class.forName( cs2[i].trim() );
               RequestMapping an = cls.getAnnotation( RequestMapping.class );
               Controller value = (Controller)cls.newInstance();

               String key = an.value();

               mapp.put(key, value);
           }
           catch(Exception e){}

       }
        System.out.println(mapp.toString());
    }

    @Override
    public void service(HttpServletRequest request,
           HttpServletResponse response) throws ServletException, IOException {
    	
    	//http://localhost:8081/mvc/*.do
    	String ctxPath = request.getContextPath(); //	/mvc
    	String uri = request.getRequestURI(); // /mvc/*.do
    	
    	uri = uri.substring(ctxPath.length()); // /*.do
    	System.out.println(uri);
    	
    	Controller ctrl = mapp.get(uri);
    	//uri의 키값으로// 즉 어떤 uri를 받았을때 어떤 controller로 가라 이런뜻.
    	if(ctrl == null){
    		System.out.println("해당 페이지는 존재하지 않습니다.");
    		return;
    	}
    	
    	//handleRequest이 throws Exception 할 수 있으니까 try catch로 묶어줌
    	try {
        	String l = ctrl.handleRequest(request, response);
        	if(l == null){ throw new Exception(); }
        	else if(l.startsWith("redirect:")){
        		System.out.println("redirect "+l);
        		response.sendRedirect(ctxPath+l.substring("redirect:".length()));
        	}else{
        		System.out.println("forward "+l);
        		RequestDispatcher rd = request.getRequestDispatcher(l);	
        		rd.forward(request, response);
        	}
		} catch (Exception e) {
			HttpSession session = request.getSession();
			session.setAttribute("err", e);
			e.printStackTrace();  
	//		response.sendRedirect(ctxPath+"/err.jsp");                                         
		}
    }
}