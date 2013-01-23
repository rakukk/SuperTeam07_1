<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="/SuperTeam07_1/css/piirivalveAdmin.css" type="text/css"/>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="TopMenu.jsp" flush="true"/>
<jsp:include page="LeftMenu.jsp" flush="true"/>


<jsp:useBean id="vaade1" class="piirivalve.beans.SaveV1" scope="session"/>

<div class="content">
  	<h1>Admin üksuse liigi vaade!</h1>
  
  
  
  <form action="http://localhost:8080/SuperTeam07_1/admin">
  	<table border="1">
  		<tr>
    		<th>1</th>
    		<th>2</th>
    		<th>3</th>
  		</tr>
  		<tr>
    		<td>Kood</td>
    		<td>$100</td>
  		</tr>
  		<tr>
    		<td>Nimetus</td>
    		<td>$80</td>
  		</tr>
  	
  	  		<tr>
    		<td>Kommentaar</td>
    		<td>
    	  	
  			First name: <input type="text" name="fname"><br>
  			Last name: <input type="text" name="lname"><br>
  			
			<input type="submit" value="Submit">
    	    
    	    
    	    <p><a href="/SuperTeam07_1/admin/?action2=pask"> dasdas </a></p>	
    	
    		</td>
  		</tr>
  	
  	  	<tr>
    		<td>Allub</td>
    		<td>$80</td>
  		</tr>
  	
  	
  	  	<tr>
    		<td>Beanist First Name: <%= vaade1.getFname() %></td>
    		<td>Beanist Last Name: <%= vaade1.getLname() %></td>
  		</tr>
  	
  	
  	
	</table>
  
  </form>

  

</div>

</body>
</html>