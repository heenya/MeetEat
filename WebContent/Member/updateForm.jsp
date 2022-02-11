<%@ include file="../Main/top.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src= "./JQuery/jquery-3.6.0.slim.js"></script>
<script type="text/javascript">

   function checkValue(){
	   
	   if(document.update.pw.value == ""){
		   alert(" 비밀번호를 입력하세요! ");
		   document.update.pw.focus();
		   return false;
	   }
	   if (document.update.nickname.value == "") {
			alert("닉네임을 입력하세요");
			document.update.nickname.focus();
			return false;
		}
		if (document.update.phone.value == "") {
			alert("전화번호를 입력하세요");
           document.update.phone.focus();
           return false;
		}
		if (document.update.phone.value.length !== 11) {
			alert("올바른 전화번호를 입력하세요");
			document.update.phone.focus();
			return false;
		}
		if (isNaN(document.update.phone.value)) {
			alert("휴대폰 번호는 숫자로만 입력해주세요");
			document.update.phone.focus();
			return false;			
		}
		if (document.update.address.value == "") {
			alert("주소를 입력하세요");
			document.update.address.focus();
			return false;
		}
		if (document.update.email1.value == "") {
			alert("이메일을 입력하세요");
			document.update.email1.focus();
			return false;
		}
		if (document.update.email2.value == "") {
			alert("이메일을 입력하세요");
			document.update.email2.focus();
			return false;
		}   
   }
   
	// 닉네임 일치 검사
	function nicknameCheck(nickname) {
		if (nickname == "") {
			alert("닉네임을 입력하세요");
			document.update.nickname.focus();
			return false;
		}
		else {
			location.href='./MemberNicknameCheck.me?nickname=' + nickname;
		}
	}
	
	// 이메일
	function email_change() {
		if (document.update.email.options[document.update.email.selectedIndex].value == '0') {
			document.update.email2.disabled = true;
			document.update.email2.value = "";
		}
		if (document.update.email.options[document.update.email.selectedIndex].value == '6') {
			document.update.email2.disabled = false;
			document.update.email2.value = "";
			document.update.email2.focus();
		} else {
			document.update.email2.disabled = true;
			document.update.email2.value = document.update.email.options[document.update.email.selectedIndex].value;
		}
	}
	
	// 우편번호 찾는 이벤트
	function daumPostcode() {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.update.postcode.value = data.zonecode;
                document.update.address.value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.update.detailAddress.focus();
            }
        }).open();
    }

</script>

   <%
     // 세션값 제어
     if(id == null){
    	 response.sendRedirect("./MemberLogin.me");
     }   
  %>

<form action="./MemberUpdateProAction.me" method="post" name="update" enctype="multipart/form-data" onsubmit="return checkValue();" class="container"> 
	<div class="row justify-content-center">
	<fieldset class="card bg-light mb-6 col-lg-6">
    <legend class="card-header">내정보 수정하기</legend>
   	<div class="p-sm-5">
		<!-- id -->
		<div class="form-group">
 			<label class="form-label mt-4">ID</label>
	     	<input type="text" class="form-control" name="id" id="id" readonly="readonly" value="${ mdto.id }">
		</div>
    
	    <!-- pw -->
	    <div class="form-group">
	      <label class="form-label mt-4">Password</label>
	      <input type="password" class="form-control col-sm-8" name="pw" id="pw" placeholder="비밀번호를 입력하세요" onkeyup="pwCheckFunction();">
	    </div>
    
	    <div class="form-group">
	      <label class="form-label mt-4">Password</label>
	      <input type="password" class="form-control col-sm-8" name="checkPw" placeholder="비밀번호를 확인하세요" onkeyup="pwCheckFunction();">
	    </div>
	    
	    <!-- 닉네임 -->
		<div class="form-group row">
 			<label class="form-label mt-4">Nickname</label>
			<div class="input-group">
	     		<input type="text" class="form-control" name="nickname" id="nickname" value="${ mdto.nickname }">
	    		<button class="btn btn-warning" type="button" onclick="nicknameCheck(this.form.nickname.value)">중복확인</button>
			</div>
		</div>
		
		<!-- 연락처 -->
		<div class="form-group">
	      <label class="form-label mt-4">Phone</label>
	      <input type="text" class="form-control col-sm-8" name="phone" id="phone"  value="${ mdto.phone }" maxlength="11">
	    </div>
	    
	   	<!-- 이메일 -->
	   	
		<div class="form-group">
	      <label class="form-label mt-4 col-sm-2">Email</label>
	      <div class=" d-flex">
	      <div class="col-sm-4"><input type="text" name="email1" id="email1" value="이메일" maxlength="50" onfocus="this.value='';" class="form-control d-inline"></div>
	      <div class="fs-3">@ </div>
		  <div class="col-sm-4"><input type="text" name="email2" value="" disabled  class="form-control d-inline"></div>
		  <div class="col-sm"><select name="email" id="email" onchange="email_change()"  class="form-select d-inline">
					<option value="0">선택하세요</option>
				 	<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
				 	<option value="naver.com">naver.com</option>
				 	<option value="hanmail.net">hanmail.net</option>
				 	<option value="6">직접 입력</option>
				</select></div></div>
	    </div>
	    
	    <!-- 주소 -->
	   	<div class="form-group">
	      <label class="form-label mt-4 col-sm-2">Address</label>
	      <div class="form-floating">
		      <div class="form-group d-flex mb-2">
		      	<div class="col-sm-2 me-2"><input type="text" class="form-control col-sm-2 d-inline"  name="postcode" id="postcode" placeholder="우편번호" ></div>
		      	<input type="button" onclick="daumPostcode()" value="우편번호 찾기" class="btn btn-warning my-sm-0">
		      	</div>
		      <div class="form-group d-flex pe-2">
		      	<div class="col-sm-8"><input type="text" class="form-control d-inline me-2" name="address" id="address" placeholder="도로명주소" size=30></div>
		      	<input type="hidden" name="extraAddress" id="extraAddress" placeholder="참고항목">
		      	<div class="col-sm"><input type="text" class="form-control d-inline" name="detailAddress" id="detailAddress" placeholder="상세주소"></div>
		      </div>
	      </div>  
	    </div>
	    
	    <!-- 수정하기, 초기화 -->
	    <div class="my-4 d-flex justify-content-end">
			    <input type="submit" value="수정하기" class="btn btn-lg btn-success px-6">
			    <input type="reset" value="초기화" class="btn btn-lg disable btn-secondary">
		</div>	    
  	</div>  <!-- <div class="p-5"> -->
	</fieldset>
	</div>
</form>    
<div class="offcanvas-header"></div>
<div class="offcanvas-header"></div>
</body>
</html>