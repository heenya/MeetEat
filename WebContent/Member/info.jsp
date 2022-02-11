<%@ include file="../Main/top.jsp" %>

<%@ page import="com.me.member.db.MemberDTO"%>
<%@ page import="com.me.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
  <%

    if(id == null){
    	response.sendRedirect("./MemberLogin.me");
    }
    // 로그인한 사용자의 모든 정보를 DB에서 가져와서 화면에 출력 
    // MemberInfoAction에서 저장한 DTO 객체 정보를 가져온다
    // request.setAttribute("mdto",mdto);
    
    MemberDTO mdto = (MemberDTO) request.getAttribute("mdto");
    // EL을 쓰면 속성을 불러와서 DTO 객체를 만들어서 굳이 다운캐스팅하여 쓰지 않아도 된다!
    
  	String profile = new MemberDAO().getProfile(id);
  %>

<form method="post" name="info" class="container">
	<div class="row justify-content-center ">
		<fieldset class="card bg-light mb-6 col-lg-6">
		<legend class="card-header ps-5">내정보</legend>
	    	<div class="p-sm-5 fs-5">
				<!-- id -->
				<div class="form-group">
		 			<label class="form-label mt-4">아이디</label>
			     	<input type="text" class="form-control col-sm-8" name="id" readonly="readonly" value="${ mdto.id }">
			   </div>
		
				
				<!-- pw -->
				<div class="form-group">
		 			<label class="form-label mt-4">비밀번호</label>
		 			<div class="input-group">
		     			<input type="text" class="form-control " name="pw" readonly="readonly" value="**********">
		    			<input type="button" onclick="location.href='./MemberModifyoldPw.me';" value="비밀번호 변경하기" class="btn btn-warning">
	    			</div>
			   </div>
		
				<!-- 레벨 -->
				<div class="form-group">
		 			<label class="form-label mt-4">회원레벨</label>
			     	<input type="text" class="form-control col-sm-8" name="id" readonly="readonly" value="${ mdto.user_level }">
			   </div>
		       
		       <!-- 포인트 -->
				<div class="form-group">
		 			<label class="form-label mt-4">포인트</label>
			     	<input type="text" class="form-control col-sm-8" name="id" readonly="readonly" value="${ mdto.user_point }">
			   </div>
		       
			    <!-- 닉네임 -->
				<div class="form-group">
		 			<label class="form-label mt-4">Nickname</label>
			     	<input type="text" class="form-control col-sm-8" name="nickname" readonly="readonly" value="${ mdto.nickname }">
				</div>
				
				<!-- 연락처 -->
				<div class="form-group">
			      <label class="form-label mt-4">Phone</label>
			      <input type="text" class="form-control col-sm-8" name="phone" readonly="readonly" value="${ mdto.phone }">
			    </div>
			    
			   	<!-- 이메일 -->
				<div class="form-group">
			      <label class="form-label mt-4">Email</label>
			      <input type="text" class="form-control col-sm-8" name="email" readonly="readonly" value="${ mdto.email }">
			    </div>
			    
			    <!-- 주소 -->
				<div class="form-group">
			      <label class="form-label mt-4">Address</label>
			      <input type="text" class="form-control col-sm-8" name="email" readonly="readonly" value="${ mdto.address }">
			    </div>
			    
			    <!-- 수정, 탈퇴, 메인 -->
			    <div class="my-4 d-flex justify-content-end">
				    <input type="button" value="수정하기" class="btn btn-success px-6" onclick="location.href='./MemberUpdate.me';">
				    <input type="button" value="탈퇴하기" class="btn btn-secondary px-6" onclick="location.href='./MemberDelete.me';">
				    <input type="button" value="메인으로" class="btn btn-warning" onclick="location.href='./Main.me';">
				</div>
					    
		    </div>  <!-- <div class="p-5"> -->
		</fieldset>
	</div>
</form>    


 <%--  	프로필 사진 : <img alt="<%=profile %>" src="<%=profile %>" style="width: 100px; height: 100px;"> <br> --%>

 <div class="offcanvas-header"></div>
 <div class="offcanvas-header"></div>
  
</body>
</html>