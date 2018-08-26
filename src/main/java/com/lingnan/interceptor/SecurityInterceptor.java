package com.lingnan.interceptor;

/**
 * Created By HongJei Lee on 2018/8/26
 */
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class SecurityInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger("log");

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        String host = request.getRemoteHost();

        if(host.equals("127.0.0.1") || host.equals("0:0:0:0:0:0:0:1")){
            InetAddress inet=null;
            try {
                inet = InetAddress.getLocalHost();
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
            host= inet.getHostAddress();
        }

        logger.log(Level.INFO,"IP为---->>> " + host + " <<<-----访问了系统");

        if(request.getRequestURI().startsWith(request.getContextPath()+"/WEB-INF/view/admin/login.jsp")){
            return true;
        }
        if(request.getSession().getAttribute("adminName") == null) {
            request.getRequestDispatcher("/WEB-INF/view/admin/login/login.jsp").forward(request,response);
            return false;
        }
        return true;
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}