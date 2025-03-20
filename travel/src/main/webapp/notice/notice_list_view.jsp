<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<ArrayList<String>> notice = (ArrayList<ArrayList<String>>) request.getAttribute("result");
	ArrayList<ArrayList<String>> notice_top = (ArrayList<ArrayList<String>>) request.getAttribute("result_top");
	String total_page = "1"; 
// 	out.print(notice);
	if (notice != null && !notice.isEmpty() && notice.get(0).size() > 6) {  //전체게시글 첫번째글의 컬럼수가 6이상일때를 체크 
		total_page = notice.get(0).get(6);  //total_page = 전체게시글 수 
	} 
	
	int pg = 1;
	if (total_page != null || !total_page.equals("1")) { //게시물이 하나라도 있을때
		float pg2 = Integer.parseInt(total_page) / 5f;  //전체 게시글 수를 한페이지에 표시할 게시글 수로 나눔 
		pg = (int) Math.ceil(pg2);  //올림해서 +1함 
	}
	
	String pageNo = request.getParameter("pageNo");  //클릭한 페이징 넘버 가져옴
	
	if (pageNo == null || pageNo.equals("1")) { //최초 게시판리스트에 접근시 페이지 번호가 없거나 1페이지를 클릭한 경우 
		pageNo = "1";
	}
%>

<form id="frm" method="get" action="./notice_delete.do">  <!-- 체크한 게시글의 nidx 전달 위해 form 사용 -->
	<main class="maincss">
		<section>
			<p>공지사항 관리페이지</p>
			<div class="subpage_view">
				<ul>
					<li><input type="checkbox" id="all_ck" onclick="ck_all(this.checked);"></li>
					<li>NO</li>
					<li></li> <!-- 첨부파일표시 -->
					<li>제목</li>
					<li>글쓴이</li>
					<li>날짜</li>
					<li>조회</li>
				</ul>

				<% if(notice == null || notice.isEmpty()){ %>
				
				<ol class="none_text">
					<li>등록된 공지 내용이 없습니다.</li>
				</ol>
				
				<% }else{ 
					int t = 0;
					while (t < notice_top.size()) {
				%>
				<!-- 최상단공지목록 -->
				<ol style="background-color:grey;">
					<li><input type="checkbox" name="n_ch" value="<%=notice_top.get(t).get(0)%>" onclick="choice_ck();"></li>
					<li></li> <!-- 글번호 -->
					
					<li> <!-- 첨부파일표시 -->
					<% 	if(notice_top.get(t).get(7) != null){%>  <!-- 첨부파일 있으면 -->
						<img src="../admin/ico/paperclip.svg" class="fileicon">
					<% 	} %>
					</li>  
					<li onclick="notice_view(<%=notice_top.get(t).get(0)%>)" title="<%=notice_top.get(t).get(2)%>" class="cc">
						<%=notice_top.get(t).get(2)%>
					</li> <!-- 글제목 -->
					<li><%=notice_top.get(t).get(3)%></li> <!-- 작성자 -->
					<li><%=notice_top.get(t).get(5).substring(0, 10)%></li> <!-- 등록일 -->
					<li><%=notice_top.get(t).get(4)%></li> <!-- 조회수 -->
				</ol>
				<%
						t++;
					}

					//리스트 출력 번호를 통 데이터 개수로 처리 
					int total = Integer.parseInt(total_page) - ((Integer.parseInt(pageNo) - 1) * 5);
					//총 데이터개수 - ((페이지번호 -1)*한페이지당 출력개수)	
	
					int w = 0;
					while (w < notice.size()) {
				%>
				<ol>
					<li><input type="checkbox" name="n_ch" value="<%=notice.get(w).get(0)%>" onclick="choice_ck();"></li>
					<li><%=total%></li> <!-- 글번호 -->
					<li> <!-- 첨부파일표시 -->
					<% 	if(notice.get(w).get(7) != null){%>  <!-- 첨부파일 있으면 -->
						<img src="../admin/ico/paperclip.svg" class="fileicon">
					<% 	} %>
					</li> 
					<li onclick="notice_view(<%=notice.get(w).get(0)%>)" title="<%=notice.get(w).get(2)%>">
						<%=notice.get(w).get(2)%>
					</li> <!-- 글제목 -->
					<li><%=notice.get(w).get(3)%></li> <!-- 작성자 -->
					<li><%=notice.get(w).get(5).substring(0, 10)%></li> <!-- 등록일 -->
					<li><%=notice.get(w).get(4)%></li> <!-- 조회수 -->
				</ol>
				<%
						total--;
						w++;
					}
				}
				%>
			</div>
			<div class="board_btn">
				<button type="button" class="border_del" onclick="notice_delete();">공지삭제</button>
				<button type="button" class="border_add" id="notice_write" onclick="location.href='./notice_write_view.do';">공지등록</button>
			</div>

			<div class="border_page">

				<ul class="pageing">
					<li><img src="../admin/ico/double_left.svg"></li>
					<li><img src="../admin/ico/left.svg"></li>
					<%
					int ww = 1;
					while (ww <= pg) {
					%>
						<li><a href="./notice_list.do?pageNo=<%=ww%>"><%=ww%></a></li>
					<%
						ww++;
					}
					%>
					<li><img src="../admin/ico/right.svg"></li>
					<li><img src="../admin/ico/double_right.svg"></li>
				</ul>

			</div>
		</section>
	</main>
</form>
<script src="../admin/js/notice/notice_list.js?v=1"></script>