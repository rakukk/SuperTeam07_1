package piirivalve;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import piirivalve.model.DataManager;

public class AdminServlet extends javax.servlet.http.HttpServlet
    implements javax.servlet.Servlet {
  private static final long serialVersionUID = 1L;

  public AdminServlet() {
    super();
    }

  public void init(ServletConfig config) throws ServletException {
    System.out.println("*** initializing controller servlet.");
    super.init(config);

    
    
    // Kas seda üldse vaja on veel kui loogika on nagunii ära tõstetud JPA ja persistence????
   
    DataManager dataManager = new DataManager();
    dataManager.setDbURL(config.getInitParameter("dbURL"));
    dataManager.setDbUserName(config.getInitParameter("dbUserName"));
    dataManager.setDbPassword(config.getInitParameter("dbPassword"));

    
    
    // Siin saab kätte web.xml init-param ja need sätitud servletile
    ServletContext context = config.getServletContext();
    context.setAttribute("base", config.getInitParameter("base"));
    context.setAttribute("imageURL", config.getInitParameter("imageURL"));
    context.setAttribute("dataManager", dataManager);
/*
    try {  // load the database JDBC driver
      //Class.forName(config.getInitParameter("jdbcDriver"));
      }
    catch (ClassNotFoundException e) {
      System.out.println(e.toString());
      }*/
    }

  protected void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
    }

  protected void doPost(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    String base = "/jsp/";
    String url = base + "index.jsp";
    
    // Peab hoolikalt mõtlema, et kas selline lahend on üldse sobiv kui tahame peale actionit toimuva suunamise
    // pealt hakata andmetega manipuleerima
    
    
    String action = request.getParameter("action");
    if (action != null) {
      if (action.equals("report"))
        url = base + "AdminAlluvusREP.jsp";
      else if (action.equals("liik"))
        url = base + "AdminLiik.jsp";
      else if (action.equals("PUU"))
        url = base + "AdminPuu.jsp";
      
      else if (action.equals("Adminyksuse_vaatamine"))
          url = base + "AdminYksus.jsp";
      
    //action.matches("(admin|(add|update|delete)Item)")) - nii saab ühe actioniga erinevaid parameetreid katta
      else if (action.matches("(admin|(add|update|delete)Item)"))   	  
        url = base + "admin.jsp";

      }
    RequestDispatcher requestDispatcher =
      getServletContext().getRequestDispatcher(url);
    requestDispatcher.forward(request, response);
    }
  }
