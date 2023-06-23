<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, myRest.SQLConnection, java.net.*"%>
<%!
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String sql = "";
   int page = 1;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>맛집검색</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Tilt+Prism&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/jquery.mobile-1.3.2.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e25fc5a61c305966cb12ffd1d8f5c65"></script>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/jquery.mobile-1.3.2.min.js"></script>
    <script src="js/custom.js"></script>

</head>
<body>
   <div id="list02" data-role="page" data-theme="c">
<%@ include file="include/header.jsp" %>
     
      <%
         /* 
         String tempPage = request.getParameter("page");
         // 현재 페이지
         if(tempPage == null || tempPage.length() == 0){
            page = 1;
         }
         try{
            page = Integer.parseInt(tempPage);
         }catch(NumberFormatException e){
            page = 1;
         }
         */
         conn = SQLConnection.initConnection();
         String param = URLDecoder.decode(request.getParameter("sectordetail"));
         String param2 = URLDecoder.decode(request.getParameter("city"));
         sql = "select * from best_restaurant where sectordetail = ? and sigundu = ? order by num desc limit 0, 10";
         try{
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, param);
            pstmt.setString(2, param2);
            rs = pstmt.executeQuery();
      %>      

        <div data-role="content">
            <div id="brand">
                <h1><span>맛집</span> <span>검색</span></h1>
                <h3>종류 : <%=param %>, 지역 : <%=param2 %></h3>
            </div>
            <div class="choice_list">
                <h2><span class="number"><i class="ri-number-3"></i></span>음식점을 선택하세요.</h2>
                <!-- listview -->
                <ul id="restaurant_v" data-role="listview" data-inset="true">      
      <%      
            while(rs.next()){
               String city = rs.getString("sigundu");
               String enCity = URLEncoder.encode(city);
               
      %>
            <input type="hidden" class="lat" name="lat" value="<%= rs.getFloat("lat") %>"/>
            <input type="hidden" class="lon" name="lon" value="<%= rs.getFloat("lon") %>"/>
               <li>
                        <a href="detail.jsp?num=<%=rs.getInt("num") %>" data-transition="slidedown">
                            <div class="roadView"></div>
                            <div class="context-box">
                                <h3><%=rs.getString("title") %></h3>
                                <p>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-half-line"></i>
                                    <i class="ri-star-line"></i>
                                </p>
                            </div>
                        </a>
                    </li>
      <%
            }
            
         
      %>
      <%
         }catch(Exception e){
              e.printStackTrace();
           }finally{
              if(rs != null)try{rs.close();}catch(SQLException e){}
              if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
              if(conn != null)try{conn.close();}catch(SQLException e){}
           }
      
        %>
            </ul>
            </div>
        </div>
        
   



<%@ include file="include/footer.jsp" %>
   </div>
</body>
</html>