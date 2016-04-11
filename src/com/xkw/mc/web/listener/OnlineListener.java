package com.xkw.mc.web.listener;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.xkw.utils.DateUtils;
import com.xkw.utils.IP;

/**
 * 在线用户监听器
 *
 */
@WebListener
public class OnlineListener implements HttpSessionListener, ServletContextListener {

	private static Map<String, OnlineModel> onlines = new HashMap<>();
	
    public OnlineListener() {
    	System.out.println("OnlineListener init");
    }

    public void contextInitialized(ServletContextEvent sce)  {
    	ServletContext context = sce.getServletContext();
    	context.setAttribute("onlines", onlines);
    }
    
    public void sessionCreated(HttpSessionEvent se)  {
    	HttpSession session = se.getSession();
    	if(session!=null) {
    		String sessionId = session.getId();
    		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
					.getRequestAttributes()).getRequest();
    		
    		//nginx反向代理, 获取用户真实ip
    		String ip = request.getHeader("X-Real-IP");
    		String location = IP.find(ip);
    		OnlineModel onlineModel = new OnlineModel(sessionId, ip, DateUtils.getDateTimeFormatStr(new Date(), "yyy-MM-dd hh:mm:ss"), location);
    		onlines.put(sessionId, onlineModel);    		
    	}
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	HttpSession session = se.getSession();
    	if(session!=null) {
    		String sessionId = session.getId();
    		onlines.remove(sessionId);
    	}
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    	
    }
	
}
