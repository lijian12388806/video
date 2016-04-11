package com.xkw.mc.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * 在线用户监听器
 *
 */
@WebListener
public class OnlineListener implements HttpSessionListener, ServletContextListener {

    public OnlineListener() {
    	System.out.println("OnlineListener init");
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    }

    
    public void sessionCreated(HttpSessionEvent se)  { 
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    }
	
}
