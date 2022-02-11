<%@ include file="../Main/top.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src= "./JQuery/jquery-3.6.0.slim.js"></script>

<script type="text/javascript">
	//pw 일치 검사
	function pwCheckFunction() {
		var pw = $('#pw').val();
		var checkPw = $('#checkPw').val();
		if(pw != checkPw) {
			$('#pwCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		} else {
			$('#pwCheckMessage').html('비밀번호가 서로 일치합니다.');
		}
	}
	// 유효성 검사
	function checkValue() {
		var oldPw = $("#oldPw").val();
		var pw = $('#pw').val();
		var checkPw = $('#checkPw').val();
		if(oldPw == "") {
			alert('현재 비밀번호를 입력하세요');
			document.modify.oldPw.focus();
			return false;
		}
		if(pw == "") {
			alert('새 비밀번호를 입력하세요');
			document.modify.pw.focus();
			return false;
		}
		if(checkPw == "") {
			alert('새 비밀번호를 재입력하세요');
			document.modify.checkPw.focus();
			return false;
		}
	}
</script>

 <%
     // 세션값 제어 
     if(id == null){
    	 response.sendRedirect("./MemberLogin.me");
     }      
%>

	<form action="./MemberModifyoldPwAction.me" method="post" name="modify" onclick="return checkValue()" class="container">
	  <div class="row justify-content-center ">
	  <fieldset class="col-lg-6">		
		  <legend class="text-center">비밀번호 변경</legend>	    
		    <!-- 기존비밀번호 -->
		    <div class="form-group mb-2 fs-5">
		      <label for="oldPW" class="col-5 col-form-label text-center">현재 비밀번호</label>  
		     	<input type="password" name="oldPw" id="oldPw" placeholder="현재 비밀번호를 입력하세요" class="col-6 ps-3">
		    </div>
		    
		 	<!-- 신규비밀번호 -->
		    <div class="form-group mb-2 fs-5">
		      <label for="pw" class="col-5  col-form-label text-center">신규 비밀번호</label>
		      <input type="password" name="pw" id="pw" placeholder="새 비밀번호를 입력하세요" onkeyup="pwCheckFunction(); " class="col-6 ps-3" >
		    </div>
			
		 	<!-- 신규비밀번호확인 -->
		    <div class="form-group mb-2 fs-5">
		      <label for="checkPw" class="col-5  col-form-label text-center">신규 비밀번호 확인</label>
		   	  <input type="password" name="checkPw" id="checkPw" placeholder="새 비밀번호를 재입력하세요" onkeyup="pwCheckFunction();" class="col-6 ps-3">
   	  		  <h5 id="pwCheckMessage" class="text-center"></h5>
		    </div>
		    
			<div class="d-flex justify-content-center">
				<button class="btn btn-lg btn-info  me-1" type="submit">비밀번호 변경</button>
				<button class="btn btn-lg btn-secondary ms-1" type="button" onclick="location.href='./Main.me'">홈페이지로 이동</button>
			</div>
		  </fieldset>
		</div>
	  </form>
 <div class="offcanvas-header"></div> 
 <div class="offcanvas-header"></div>
</body>
</html> 