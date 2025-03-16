<%@page import="admin.dto_member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
HttpSession se = request.getSession();
dto_member dm = (dto_member)se.getAttribute("dto");

%>    
<header class="headercss">
    <div class="header_div">
        <p><img src="./img/logo.png" class="logo_sm"> ADMINISTRATOR</p>
        <p><%=dm.getMname() %> 님 관리자 <a href="#">[개인정보 수정]</a> <a href="./loginout.do">[로그아웃]</a></p>
    </div>
</header>
<nav class="navcss">
    <div class="nav_div">
        <ol>
            <li title="쇼핑몰 상품관리">쇼핑몰 관리자 리스트</li>
            <li title="쇼핑몰 상품관리">쇼핑몰 상품관리</li>
            <li title="쇼핑몰 기본설정">쇼핑몰 기본설정</li>
            <li title="쇼핑몰 공지사항">쇼핑몰 공지사항</li>
        </ol>
    </div>

</nav>