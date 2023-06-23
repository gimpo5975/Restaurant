<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String data = "운동 독서 음악감상";
   String[] hobbyArray = {"운동", "여행", "독서", "음악감상", "쇼핑"};
   int i = 1;
%>

<ul>
               <li data-role="fieldcontain">
                  <label id="radiobox">취미</label> 
                  <fieldset data-role="controlgroup">
                   <%
                     i = 1;
                     for(String hobbys : hobbyArray) {
                    	 if(data.contains(hobbys)){
                    		 out.println("<input type=\"checkbox\" name=\"hobby\" id=\"hobby"+i+"\" value=\""+hobbys+"\" checked>");
                    		 out.println("<label for=\"hobby"+i+"\">"+hobbys+"</label>");
                    	 }else{
                    		 out.println("<input type=\"checkbox\" name=\"hobby\" id=\"hobby"+i+"\" value=\""+hobbys+"\">");
                    		 out.println("<label for=\"hobby"+i+"\">"+hobbys+"</label>");                 		 
                    	 }
                    	 i++;
                     }
                  %>                  
                  </fieldset> 
               </li>
</ul>

</body>
</html>