<%@page contentType="text/html;charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html ng-app="form-demo-app">

<head>
   <meta charset="UTF-8">
   <title>폼 벨리데이션 예제</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/join.css">
   <style>
      .container {
         margin-top: 20px;
      }

      input.ng-invalid {
         border: 5px solid red;
      }
   </style>
   <script>
      window.onload = function () {
         document.getElementById("join_btn").onclick = function (e) {
            var pwdval = document.getElementById("pwd").value;
            var pwdcheck = document.getElementById("pwdcheck").value;

            if (pwdcheck != pwdval) {
               alert("비밀번호 입력이 일치하지 않습니다.");
               e.preventDefault();
               return false;
            }
         }
      };





      function checkPrtsBirthday() {
         var birthday = $("#birthday").val();
         var pyy = $("#pyy").val();
         var pmm = $("#pmm").val();
         var pdd = $("#pdd").val();
         var oMsg = $("#pbirthdayMsg");

         if (pyy == "" && pmm == "" && pdd == "") {
            showErrorMsg(oMsg, "필수 정보입니다.");
            return false;
         }
         if (pyy == "" || pmm == "" || pdd == "" || pdd.indexOf('e') != -1 || pdd.indexOf('E') != -1) {
            showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
            return false;
         }
         if (pmm.length == 1) {
            pmm = "0" + pmm;
         }
         if (pdd.length == 1) {
            pdd = "0" + pdd;
         }

         var pbirthday = pyy + pmm + pdd;
         if (!isValidDate(pbirthday)) {
            showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
            return false;
         }
         $("#pbirthday").val(pbirthday);

         var age = calcAge(birthday);
         var page = calcAge(pbirthday);
         if (page < 0) {
            showErrorMsg(oMsg, "미래에서 오셨군요. ^^");
            return false;
         } else if (page >= 100) {
            showErrorMsg(oMsg, "정말이세요?");
            return false;
         } else if (page - age < 19) {
            showErrorMsg(oMsg, "보호자(법정대리인) 동의 기준이 맞지 않습니다.");
            return false;
         } else {
            hideMsg(oMsg);
            return true;
         }
         return true;
      }







     
      //1) 아이디 확인   
      function check() {
         var m_id = f.m_id.value;
         m_id = m_id.trim();
         if (m_id.length < 5 || m_id.length > 10) {
            alert("아이디가 5~10자 이내인지 확인해주세요");
            f.m_id.focus();
            return false;
         } //if end

         //2) 비밀번호 확인            
         var pwdval = f.pwd.value;
         pwdval = trim(pwdval);
         if (pwdval.length == 0) {
            alert("비밀번호를 입력하세요.");
            f.pwd.value = "";
            f.pwd.focus();
            return false;
         } else {
            pass = checkByteLen(pwdval, 30);
            if (!pass) {
               alert("비밀번호가 너무 깁니다. (영어 소문자/숫자 15자이내)");
               f.pwd.focus();
               return false;
            }
         }

         //3) 비밀번호 일치여부 확인      
         var pwdcheck = f.pwdcheck.value;
         pwdcheck = trim(pwdcheck);
         if (pwdcheck.length == 0) {
            alert("비밀번호 확인란을 입력하세요.");
            f.pwdcheck.value = "";
            f.pwdcheck.focus();
            return false;
         }

         if (pwdcheck != pwdval) {
            alert("비밀번호 입력이 일치하지 않습니다.");
            return false;
         }

         //4) 이름 2~20자 이내인가
         var mname = f.mname.value;
         mname = mname.trim();
         if (mname.length < 2 || mname.length > 20) {
            alert("이름을 2~20자 이내로 입력해주세요.");
            f.mname.focus();
            return false;
         } //if end
         //5) 이메일@ 문자가 있는가
         var email = f.email.value;
         email = email.trim();
         if (email.indexOf('@') == -1) {
            alert("이메일을 올바르게 입력해주세요.")
            f.email.focus();
            return false;
         } //if end
      }

      function idCheck() { //새창 만들기 
         window.open("idCheckForm.jsp", "idwin", "width=400, height=350");

         var f = document.getElementById("id");
         f.readOnly = false;
      }
   </script>


   <!-- 추가한 부분 (로그인 확인 js)-->
   <!-- 카카오맵 도로명주소 api -->
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
      function readOnly() {
         var f = document.getElementById("addr2");
         f.readOnly = false;
      }

      function Postcode() {
         new daum.Postcode({
            oncomplete: function (data) {
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
               if (data.userSelectedType === 'R') {
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                     extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== '' && data.apartment === 'Y') {
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraAddr !== '') {
                     extraAddr = ' (' + extraAddr + ')';
                  }
                  // 조합된 참고항목을 해당 필드에 넣는다.
                  document.getElementById("addr2").value = extraAddr;

               } else {
                  document.getElementById("addr2").value = '';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('postalcode').value = data.zonecode;
               document.getElementById("addr").value = addr;
               readOnly();
               // 커서를 상세주소 필드로 이동한다.
               document.getElementById("addr2").focus();
            }
         }).open();
      }
   </script>

</head>

<body ng-controller="mainCtrl">
   <div class="container" id="wrap">
      <div class="row">
         <div class="col-md-6 col-md-offset-3">



            <form name="f" action="join.do?m=insert" method="post">
               <legend>회원가입</legend>

               <div class="form-group row">
                  <div class="col-md-12">
                     <input class="form-control input-lg" id="m_id" name="m_id" placeholder="ID" required>
                  </div>


               </div>
               <div class="form-group">
                  <input type="button" value="사용가능 ID 조회" onclick="idCheck()">
               </div>


               <input type="text" id="pwd" name="pwd" class="form-control input-lg" placeholder="비밀번호"
                  ng-model="user.password" ng-required="true" ng-pattern="/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$/"
                  required />
               <br>
               <input type="text" id="pwdcheck" name="pwdcheck" class="form-control input-lg" placeholder="비밀번호 재확인"
                  ng-model="user.repassword" ng-required="true" required />

               <br>
               <div ng-show="signUpForm.password.$error.pattern" class="alert alert-warning" role="alert">최소 5글자, 최대
                  10글자이고 적어도 1개의 소문자, 대문자, 숫자를 포함해야합니다.</div>

               <div class="row">
                  <div class="col-xs-12 col-md-12">
                     <input type="text" name="name" class="form-control input-lg" ng-model="user.firstName"
                        placeholder="이름" ng-required="true" required />
                  </div>
               </div>

               <br>

               <input type="text" name="brith" class="form-control input-lg" placeholder="생년월일  ex) 19951231"
                  ng-model="user.birth" required ng-required="true" />
               <br>


       
               <input type="text" name="phone" class="form-control input-lg" placeholder="휴대전화  ex) 01059541454"
               ng-model="user.phone" required ng-required="true" />
               <br> 
   
               <input type="text" name="email" class="form-control input-lg" placeholder="이메일  ex) away@gmail.com"
               ng-model="user.email" required ng-required="true" />
               <br>


               <div class="form-group row">
                  <div class="col-md-12">
                     <label for="c_address" class="text-black">주소 <span class="text-danger"></span></label>

                     <div class="form-group">
                        <input type="text" class="form-control" id="postalcode" name="postalcode" placeholder="우편번호"
                           onclick="Postcode()">
                     </div>

                     <input readOnly type="text" class="form-control" id="addr" name="addr" placeholder="도로명주소">
                  </div>
               </div>

               <div class="form-group">
                  <input readOnly type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소">
               </div>

               <h5>
                  <label>성별 : </label>
                  <input type="radio" name="gender" ng-model="user.gender" value="M">남자
                  <input type="radio" name="gender" ng-model="user.gender" value="F">여자
               </h5>





               <!-- <input type="button" value="Join" class="btn btn-primary py-3 px-5" onkeydown="check()" onclick="check()">    -->

               <button id="join_btn" class="btn btn-lg btn-primary btn-block signup-btn" type="submit">회원가입</button>



            </form>






         </div>
      </div>
   </div>
</body>


</html>