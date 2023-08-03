package hl.ep.view.bean;

//import hl.foundation.view.common.utils.ADFUtil;

import java.io.IOException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Hashtable;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;

import javax.el.ValueExpression;
import javax.naming.NamingException;

import javax.security.auth.Subject;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.login.FailedLoginException;
import javax.security.auth.login.LoginException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.event.DialogEvent;

import weblogic.security.URLCallbackHandler;
import weblogic.security.services.Authentication;
import weblogic.servlet.security.ServletAuthentication;

import javax.faces.application.Application;

import javax.el.ExpressionFactory;

import javax.el.ELContext;

import javax.faces.model.SelectItem;

import javax.naming.Context;
import javax.naming.InitialContext;

import javax.sql.DataSource;


public class LoginBackingBean  {
    
    private String _username;
    private String _password;
    private String _selectedLanguaje="en";
    private static final String ADF_AUTH_ROOT = "/adfAuthentication?success_url=/faces";
    private final static String WELCOME_PAGE = "/CapturaCriteriosHome.jspx";
    //private final static String WELCOME_PAGE = "/principal.jsf";
    private static final String LOGOUT_URL = "/adfAuthentication?logout=true&amp;end_url=/faces/login.jspx";
    //private final static String WELCOME_PAGE = "/Testing1.jspx";
    
    public String doLogin() {
        String un = _username;
        byte[] pw = _password.getBytes();
        
        // Start Defect : buscar el usuario por medio de un query directo Author: Raul G.
        //boolean exit = searchUser(un.toLowerCase());
        //if(exit){ un = "otro"; }
        
        
        FacesContext ctx = FacesContext.getCurrentInstance();
            final HttpServletRequest request = (HttpServletRequest)ctx.getExternalContext().getRequest();
            final CallbackHandler handler = new URLCallbackHandler(un, pw);
            //String userNameUI = this.getManagedBeanValue("o_w_s_l_LoginBackingBean.userName").toString();
            //System.out.println("userNameUI :"+userNameUI);
            //final CallbackHandler handler = new URLCallbackHandler("weblogic", "weblogic1");
            try {
                final Subject loginSubject = Authentication.login(handler);
                ServletAuthentication.runAs(loginSubject, request);
                HttpServletResponse response = (HttpServletResponse)ctx.getExternalContext().getResponse();
                welcomePage(true);
                //sendForward(request, response, loginUrl);

                 } catch (FailedLoginException fle){
                    FacesMessage msg =
                        new FacesMessage(FacesMessage.SEVERITY_ERROR, "Nombre de Usuario o Password incorrecto",
                                 "Verificar el nombre de usuario o password ingresados");

                        ctx.addMessage(null, msg);
                        _username = null;
                        _password = null;
            
                } catch (LoginException le) {
                        reportUnexpectedLoginError("LoginException", le);
        
                }
        return null;
        
        //End Defect
    }
    
    
    public boolean searchUser(String usr){
              System.out.println("Conexion a BD RT_NMP_USERS");
              //System.out.println("Buscando user : " + usr);
              Context env = null;
              DataSource pool = null;
              Hashtable ht = new Hashtable( );
              boolean ban = true;
             
              
              ht.put(Context.INITIAL_CONTEXT_FACTORY,"weblogic.jndi.WLInitialContextFactory");        
              Connection conn = null;
              Statement stmtRegion = null;
              
              try
              {
              env = new InitialContext(ht);
              //Lookup this DataSouce at the top level of the WebLogic JNDI tree
              pool = (DataSource) env.lookup ("jdbc/BPM_DS"); 
              StringBuilder sqlUser = new StringBuilder();
              sqlUser.append("SELECT NOMBRE FROM NMP_USUARIOS WHERE NOMBRE='").append(usr).append("'");
              //System.out.println(sqlUser.toString());
              ResultSet rsUser = null;
              ResultSetMetaData rsmUser = null;       
              conn = pool.getConnection( );
                            
              // CONSULTA DE REGIONES
              stmtRegion = conn.createStatement( );//create a java.sql.Statement
              
              
              rsUser = stmtRegion.executeQuery(sqlUser.toString()); 
              rsmUser = rsUser.getMetaData( );
              
              SelectItem itemRegion = null;
              
                  while( rsUser.next( )){ 
                      String userName = rsUser.getString("NOMBRE");
                      //System.out.println("Usuario : " + userName);
                       ban =false;
                       break;
                      
                      
                                                   
                  } 
              
              } catch (Exception e) {
                   System.out.println("------" + e);
              } finally {
                   try{
                       stmtRegion.close( );
                       conn.close( );
                   } catch (SQLException sqle){  
                           System.out.println("------" + sqle);
                   }
                    return ban;    
               }    
              
          }
    
    private  Object getManagedBeanValue(String beanName) {
        StringBuffer buff = new StringBuffer("#{");
        buff.append(beanName);
        buff.append("}");
        return resolveExpression(buff.toString());
    }


    private Object resolveExpression(String expression) {
          FacesContext facesContext = FacesContext.getCurrentInstance();
          Application app = facesContext.getApplication();
          ExpressionFactory elFactory = app.getExpressionFactory();
          ELContext elContext = facesContext.getELContext();
          ValueExpression valueExp = 
              elFactory.createValueExpression(elContext, expression, 
                                              Object.class);
          return valueExp.getValue(elContext);
      }
    
    
    /**
     * Log the user out from the current session.
     * @return
     * @throws IOException
     */
    public void doLogout(ActionEvent actionEvent) throws IOException {  
        final ExternalContext externalCtx = FacesContext.getCurrentInstance().getExternalContext();
        final HttpSession session = (HttpSession)externalCtx.getSession(false);
        showPage(LOGOUT_URL, false);
        if (((HttpServletRequest)externalCtx.getRequest()).isRequestedSessionIdValid() && null != session)
            session.invalidate();
    }
    
    private void sendForward(HttpServletRequest request,
                             HttpServletResponse response, String forwardUrl) {
        FacesContext ctx = FacesContext.getCurrentInstance();
               
        RequestDispatcher dispatcher =
            request.getRequestDispatcher(forwardUrl);
        try {
            
            
            dispatcher.forward(request, response);
            
            System.out.println("exito....");
        } catch (ServletException se) {
            reportUnexpectedLoginError("ServletException", se);
        } catch (IOException ie) {
            reportUnexpectedLoginError("IOException", ie);
        }
        
        ctx.responseComplete();
    }

    private void reportUnexpectedLoginError(String errType, Exception e) {
        FacesMessage msg =
            new FacesMessage(FacesMessage.SEVERITY_ERROR, "Unexpected error during login",
                             "Unexpected error during login (" + errType +
                             "), please consult logs for detail");
        FacesContext.getCurrentInstance().addMessage(null, msg);
        e.printStackTrace();
    }
    
    public void setUsername(String _username) {
        this._username = _username;
    }

    public String getUsername() {
        return _username;
    }

    public void setPassword(String _password) {
        this._password = _password;
    }

    public String getPassword() {
        return _password;
    }
    
    
    private void welcomePage(boolean newWindow) {
        final FacesContext ctx = FacesContext.getCurrentInstance();
        final HttpServletRequest request = (HttpServletRequest)ctx.getExternalContext().getRequest();
        final String currentView = ctx.getViewRoot().getViewId();
        final String welcomePage =
            (currentView == null || currentView.isEmpty() || currentView.equals("/login.jspx") ||
             currentView.equals("/login") || currentView.equals("/navigation.jspx") ||
             currentView.equals("navigation")) ? WELCOME_PAGE : currentView;
        
        final String loginUrl = ADF_AUTH_ROOT + welcomePage;
      
        final HttpServletResponse response = (HttpServletResponse)ctx.getExternalContext().getResponse();
        
        HttpSession session = (HttpSession)ctx.getExternalContext().getSession(false);
        session.setAttribute("sessionUserLocale","es");
        //System.out.println("selected languaje : ----"+_selectedLanguaje);
        forward(request, response, loginUrl);
    
        /**Code Ends*/

    }
    /**
     * Forward the Servlet request to the specified URL.
     * @param request
     * @param response
     * @param forwardUrl
     */
    private void forward(final HttpServletRequest request, final HttpServletResponse response,
                         final String forwardUrl) {
        final FacesContext ctx = FacesContext.getCurrentInstance();
        try {
            //replaced "/hdms/faces/" with request.getContextPath() to fix "Cannot forward a response that is already committed"
            ctx.getExternalContext().redirect(request.getContextPath() + forwardUrl);
        } catch (IOException ioe) {
            // TODO: Add catch code
            ioe.printStackTrace();
        }
        //final RequestDispatcher dispatcher = request.getRequestDispatcher(forwardUrl);
    //        try {
    //            dispatcher.forward(request, response);
    //        } catch (ServletException se) {
    //            reportLoginError("ServletException", se);
    //        } catch (IOException ie) {
    //            reportLoginError("IOException", ie);
    //        }
        ctx.responseComplete();
    }
    
    /**
     * Redirect to the specified page
     * @param pageName
     * @param prependFace
     */
    private void showPage(final String pageName, boolean prependFace) {                    
        final FacesContext ctx = FacesContext.getCurrentInstance();
        final HttpServletRequest request = (HttpServletRequest)ctx.getExternalContext().getRequest();
        final String destination = prependFace ? "/faces" + pageName : pageName;
        final HttpServletResponse response = (HttpServletResponse)ctx.getExternalContext().getResponse();
        forward(request, response, destination);
    }

    public void setSelectedLanguaje(String _selectedLanguaje) {
        this._selectedLanguaje = _selectedLanguaje;
    }

    public String getSelectedLanguaje() {
        return _selectedLanguaje;
    }
}
