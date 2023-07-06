package util;

import java.io.IOException;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserUtil {
    public static boolean isLogIn(HttpServletRequest req) {
        HttpSession session = req.getSession();
        boolean isLogIn = false;
        if (session.getAttribute("login") != null && !session.getAttribute("login").equals("")) {
            isLogIn = true;
        }
        return isLogIn;
    }

    public static void logOut(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
    	session.removeAttribute("login");
        try {
			res.sendRedirect("./main.jsp?content=bbslist");
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    public static void setPreUrl(HttpServletRequest req, String preUrl)  {
        HttpSession session = req.getSession();
        session.setAttribute("preUrl", preUrl);
    }
}