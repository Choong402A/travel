<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<ArrayList<String>> pv = (ArrayList<ArrayList<String>>)request.getAttribute("result");
/* 
페이징 생성방법
1. 한 페이지당 몇개씩 데이터를 출력할 것인지를 설정합니다.
2. 데이터베이스에 있는 데이터의 총 갯수 / 한페이지당 갯수 (소수점)
3. Math.ceil 사용하는 이유는 1.1 1.6 => 반올림으로 페이지가 추가 되도록 합니다.
*/
String total_page = null; // 초기화
if (pv != null && !pv.isEmpty() && pv.get(0) != null && pv.get(0).size() > 11) {
    total_page = pv.get(0).get(11);
}

int pg = 1;
if(total_page != null && !total_page.equals(null)){
	String nocom = total_page.replace(",", "");
	float pg2 = Integer.parseInt(nocom) / 3f;
	pg = (int)Math.ceil(pg2); 
	System.out.println(pg);
}

/*
get page번호를 가져오는 방식
최초 공지사항 리스트 페이지에 접근시 페이지 번호가 없을 수 있음 또는 
페이지번호가 1을 클릭했을 경우
*/
String pno = request.getParameter("pageno");
if(pno == null || pno.equals("1")){
	pno = "1";
}





%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 등록 페이지</title>
    <link rel="stylesheet" type="text/css" href="../admin/css/basic.css?v=1">
    <link rel="stylesheet" type="text/css" href="../admin/css/login.css?v=2">
    <link rel="stylesheet" type="text/css" href="../admin/css/main.css?v=1">
    <link rel="stylesheet" type="text/css" href="../admin/css/product.css?v=6">
    <link rel="icon" href="../admin/img/logo.png" sizes="128x128">
    <link rel="icon" href="../admin/img/logo.png" sizes="64x64">
    <link rel="icon" href="../admin/img/logo.png" sizes="32x32">
    <link rel="icon" href="../admin/img/logo.png" sizes="16x16">
</head>
<body>
<header class="headercss">
    <div class="header_div">
        <p><img src="./img/logo.png" class="logo_sm"> ADMINISTRATOR</p>
        <p>홍길동 관리자 <a href="#">[개인정보 수정]</a> <a href="#">[로그아웃]</a></p>
    </div>
</header>
<nav class="navcss">
    <div class="nav_div">
        <ol>
            <li title="쇼핑몰 관리자 리스트">쇼핑몰 관리자 리스트</li>
            <li title="쇼핑몰 상품관리">쇼핑몰 상품관리</li>
            <li title="쇼핑몰 기본설정">쇼핑몰 기본설정</li>
            <li title="쇼핑몰 공지사항">쇼핑몰 공지사항</li>
        </ol>
    </div>

</nav>
<main class="maincss">
<section>
<p>상품관리 페이지</p>
<div class="subpage_view">
    <span>등록된 상품 <%= (pv != null ? pv.size() : 999)%>건</span>
    <span>
        <form id="frm" method="post" action="./a_projduct_listok.do">
        <select class="p_select1" name="hw_select">
            <option value="selname">상품명</option>
            <option value="selcode">상품코드</option>
        </select>
        <input type="text" class="p_input1" name="hw_s_word" placeholder="검색어를 입력해 주세요">
        <input type="submit" value="검색" title="상품검색" class="p_submit">
        </form>
    </span>
</div>
<div class="subpage_view2">
    <ul>
        <li><input type="checkbox"></li>
        <li>코드</li>
        <li>이미지</li>
        <li>상품명</li>
        <li>카테고리 분류</li>
        <li>판매가격</li>
        <li>할인가격</li>
        <li>할인율</li>
        <li>재고현황</li>
        <li>판매유/무</li>
        <li>품절</li>
        <li>관리</li>
    </ul>
        <%
    int i;
    int j = (pv != null ? pv.size() : 0);
    if(j == 0){
    	out.println("<ul><li style='width: 100%;'>등록된 상품이 없습니다.</li></ul>");
    }else{
    	for(i =0;i<pv.size();i++){
    %>
    <ul>

        <li><input type="checkbox"></li>
        <!-- 상품코드 -->
        <li><%= (pv != null ? pv.get(i).get(1) : 0) %></li>
        <!-- 이미지 -->
        <li><%= (pv != null ? pv.get(i).get(2) : "") %></li>
        <!-- 상품명 -->
        <li><%= (pv != null ? pv.get(i).get(3) : 0) %></li>
        <!-- 카테고리 -->
        <li><%= (pv != null ? pv.get(i).get(4) : 0) %>
        	<%= (pv != null ? pv.get(i).get(5) : "") %>
        </li>
        <!-- 판매가격 -->
        <li>30,000</li>
        <!-- 할인가격 -->
        <li><%= (pv != null ? pv.get(i).get(6) : 0) %></li>
        <!-- 할인율 -->
        <li><%= (pv != null ? pv.get(i).get(7) : 0) %></li>
        <!-- 재고현황 -->
        <li><%= (pv != null ? pv.get(i).get(8) : 0) %></li>
        <!-- 판매 유/무 -->
        <li><%= (pv != null ? pv.get(i).get(9) : 0) %></li>
        <!-- 품절 유/무 -->
        <li><%= (pv != null ? pv.get(i).get(10) : 0) %></li>
        <li>관리</li>

    </ul>
            <%
    	j--;
    	}
    }
    %>
</div>
<div class="subpage_view3">
    <ul class="pageing">

        <li><img src="../admin/ico/double_left.svg"></li>
        <li><img src="../admin/ico/left.svg"></li>
            <% int w= 1;
    	while(w <= pg){
    %>
        <li><a href="./a_projduct_listok.do?pageno=<%=w%>"><%=w%></a></li>
            <%
    w++;
    	}
    %> 
        <li><img src="../admin/ico/right.svg"></li>
        <li><img src="../admin/ico/double_right.svg"></li>
   
    </ul>
</div>
<div class="subpage_view4">
    <input type="button" value="선택상품 삭제" title="선택상품 삭제" class="p_button">
    <span style="float: right;">
    <input type="button" value="신규상품 등록" title="신규상품 등록" class="p_button p_button_color1" onclick="location.href='./product_write.html'" >
    <!-- <input type="button" value="카테고리 등록" title="카테고리 등록" class="p_button p_button_color2"> -->
    </span>
</div>
</section>
</main>
<footer class="main_copyright">
    <div>
        Copyright ⓒ 2024 shopbag All rights reserved.
    </div>
</footer>
</body>
</html>