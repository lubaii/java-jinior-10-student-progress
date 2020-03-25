package filters;

import utils.CookiesUtils;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse)servletResponse;
         req.setCharacterEncoding("UTF-8");
         if(req.getSession().getAttribute("isLogin")==null){}
         req.getSession().setAttribute("isLogin","true");
         req.getSession().setAttribute("user","Вася");
         filterChain.doFilter(req,resp);
    }

    public void destroy() {

    }
}
