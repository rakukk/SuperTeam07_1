<%@page import="sun.org.mozilla.javascript.internal.ast.WhileLoop"%>
<%@page language="java" contentType="text/html"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.List"%>
<%@page import="piirivalve.beans.Vaade"%>

<% String base = (String)application.getAttribute("base"); %>
<% String test = pageContext.getServletConfig().getInitParameter("testParam"); %>

<jsp:useBean id="dataManager" scope="application"
  class="piirivalve.model.DataManager"/>
  
<div class="menu"> 
  
  <div class="box">
    <div class="title">Menüü</div>
<%
    //Hashtable categories = dataManager.getCategories();
	//Hashtable categories = new Hashtable();
	//categories.put(new Integer(1), "ESIMENE");
	List <Vaade> vaated = dataManager.getCategories();

    //Enumeration<Integer> categoryIds = categories.keys();
    //while (categoryIds.hasMoreElements()) {
      //Object categoryId = categoryIds.nextElement();
      
      // Siin peab mõtlema, et kas muuta tegevus HASHTABLE pealt List <Vaade> peale ning kirjutada Andmebaasi ka vaadete actionid v jsp lehed
      // Sest natuke ebamugavaks muutub see majandamine siin  ?action=puu see puu osa peaks olema muutuv v siis üldse hardcoded vaated
      //out.println("<p><a href=" + base + "?action="+ categoryId +">" + categories.get(categoryId) + "</a></p>"
        //);   
      //}
    
	for (int i = 0; i < vaated.size(); i++){
		
		out.println("<p><a href=" + base + "?action="+ vaated.get(i).getJspName() +">" + vaated.get(i).getName() + "</a></p>");
	}
    
    
    //Testime siin parameetrit web.xmlist
    out.println("<p>" + test + "</p>");
    out.println("<p>" + base + "</p>");
    
    out.println(pageContext.getServletConfig().getInitParameter("testParam"));
    
    out.println(config.getInitParameter("hello"));
    
    
  %>
  
  	
    </div>
  </div>
