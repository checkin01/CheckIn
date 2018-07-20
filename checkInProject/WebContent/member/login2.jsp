<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page errorPage="../j03_error/errorPage.jsp" autoFlush="false" %>
<style>



</style>
<!-- 로그인 페이지 -->
<%
   String userid = request.getParameter("userid");
   String userpwd = request.getParameter("userpwd");
   
   //DB
   //페이지이동 : response.sendRedirect("page 주소);
   
   int a = Integer.parseInt(userid);
   
   if(userid.equals("abcd") && userpwd.equals("1234")){//로그인성공
      %>
      <script>
         alert("로그인 성공하였습니다...");
         location.href="../index.jsp";
      </script>
      <%
      //response.sendRedirect("../index.jsp");//index.jsp
   }else{//로그인실패
      %>
      <script>
         alert("아이디 또는 비밀번호가 잘못입력되었습니다...");
         location.href="loginFrm.html";
      </script>
      <%
      //response.sendRedirect("loginFrm.html");//loginform.html      
   }   
%>