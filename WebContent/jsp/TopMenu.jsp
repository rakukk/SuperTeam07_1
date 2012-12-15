<%@page language="java" contentType="text/html"%>
<%
  String base = (String)application.getAttribute("base");
  String imageURL = (String)application.getAttribute("imageURL");
  %>
<div class="header">
  <div class="logo">
    <p>Piirivalve andmehaldus</p>
    </div>
  <div class="logo pilt">
    <a class="link2" href="http://www.politsei.ee/et/">dyn teha ja css läks valeks
      <img src="<%=imageURL %>/piirikotkas.jpg" alt="Piirikotkas" height="70" width="60" border="0"/></a>   
    </div>
  </div>