<%@page import="java.util.ArrayList"%>
<%@ page import="com.me.member.db.MemberDTO"%>
<%@ page import="com.me.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>meeteat!</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/bootstrap.css" rel="stylesheet" />
    </head>
<body>

<!-- 상단 메뉴 -->
<jsp:include page="../Main/top.jsp"></jsp:include>
<div class="offcanvas-header"></div>
 <div class="offcanvas-header"> <!-- top~body 사이 공백 -->　</div>
<!-- 상단 메뉴 -->
 
<%--    
   <%
     // 세션제어 (로그인X,관리자X)
     String id = (String)session.getAttribute("id");
   
    if(id == null || !id.equals("admin") ){
    	response.sendRedirect("./MemberLogin.me");
    }
     
    // request.setAttribute("memberList", dao.getMemberList());
   %> --%>
   ${memberList }
   <div class="container">
   <table class="table table-hover">
     <tr class="table-dark">
<!--       <th scope="row">No</th> -->
       <th scope="row">아이디</th>
       <th>비밀번호</th>
       <th>닉네임</th>
       <th>전화번호</th>
       <th>이메일</th>
       <th>주소</th>
       <th>회원포인트</th>
       <th>회원등급</th>
       <th>누적신고횟수</th>
       <th>관리</th>
     </tr>
     
     
     <%
     	ArrayList memberList =
    	(ArrayList)request.getAttribute("memberList");
     %>
     

     <c:forEach var="dto" items="${memberList }">
         <tr>
	       <td>${dto.id }</td>
	       <td>${dto.pw }</td>
	       <td>${dto.nickname }</td>
	       <td>${dto.phone }</td>
	       <td>${dto.email }</td>
	       <td>${dto.address }</td>
	       <td>${dto.user_point }</td>
	       <td>${dto.user_level }</td>
	       <td>${dto.reported_count }</td>
	       <td><input type="button" value="정지" class="btn btn-danger me-1 btn-sm"><input type="button" value="삭제" class=" btn btn-dark btn-sm"></td>
	     </tr>
     </c:forEach>    
     
   </table>
   
   </div>
   
   
   
   
   
</body>
</html>