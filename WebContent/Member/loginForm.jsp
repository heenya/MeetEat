<%@ include file="../Main/top.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src= "./JQuery/jquery-3.6.0.slim.js"></script>
 
<form action="./MemberLoginAction.me" method="post" id="login" onclick="return checkValue()"  class="container">
  <div class="row justify-content-center">
	  <fieldset class="col-lg-6">			    
	    <!-- 아이디 -->
	    <div class="form-group mb-2 fs-4">
	      <label for="id" class="col-5 col-form-label text-center">아이디</label>
	     	<input type="text" class="col-6 ps-3" name="id" >  
	    </div>
	    
	 	<!-- 비밀번호 -->
	    <div class="form-group mb-2 fs-4">
	      <label for="pw" class="col-5 col-form-label text-center">비밀번호</label>
	      <input type="password" class="col-6 ps-3" name="pw">
	    </div>
		
		<!-- 제출버튼 -->
		<div class="d-flex justify-content-center">
			<button class="btn btn-lg btn-info mb-2 px-5" type="submit">로그인</button>
		</div>
		<div class="d-flex justify-content-center ">
			<a href='./MemberFindIdAction.me' class="nav-link me-2">아이디찾기</a>
			<a href='./MemberFindPwAction.me' class="nav-link me-2">비밀번호찾기</a>
			<a href='./MemberJoin.me' class="nav-link">회원가입</a>
		</div>
		

	  </fieldset>
	
  </div>
</form>

<div class="offcanvas-header"></div> 
<div class="offcanvas-header"></div>
</body>
</html>