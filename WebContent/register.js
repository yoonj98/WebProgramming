function check1() { //중복체크
var frm=document.enroll;
 if (frm.id.value.length < 4) {
  alert("아이디는 4자 이상 입력해주세요");
 }  else {
  window.open("./joinID.jsp?userId=" + frm.id.value, "",
    "width=10px,height=10px");
 }
}
function check2() { //중복체크
var frm=document.enroll;
  window.open("./joinE_mail.jsp?e_mail=" + frm.e_mail.value, "",
    "width=10px,height=10px");
}
function check3(){
   var frm=document.enroll;
       if (frm.id.value == "") {
      alert("아이디를 입력해주십시오");
      frm.id.focus();
      return false;
      }
      else if (frm.e_mail.value == "") {
      alert("이메일을 입력해주십시오");
      frm.e_mail.focus();
      return false;
      }

      else if (frm.passwd.value == "") {
      alert("비밀번호를 입력해주십시오");
      frm.passwd.focus();
      return false;
      }
      else if (frm.name.value == "") {
      alert("이름을 입력해주십시오");
      frm.name.focus();
      return false;
      }
      else if (frm.sex.value == "") {
      alert("성별을 정해주십시오");
      frm.sex.focus();
      return false;
      }
      else if (frm.birth.value == "") {
      alert("생일을 입력해주십시오");
      frm.birth.focus();
      return false;
      }
      else if (frm.phone.value == "") {
      alert("연락 가능한 번호를 입력해주십시오");
      frm.phone.focus();
      return false;
      }
      else{
         frm.submit();
      }
}