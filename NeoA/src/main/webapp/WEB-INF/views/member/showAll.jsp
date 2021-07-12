<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<%-- 전체 목록 출력을 위한 테스트 by jaehoon --%>
전체 목록 출력
<div class="container">
	<c:forEach items="${postVOList}" var="list">

		<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
			<div class="single-popular-items mb-50 text-center">
				<div class="popular-img">
					<a
						href="${pageContext.request.contextPath}/user/productDetails?productNo=${list.productNo}">
						<img
						src="${pageContext.request.contextPath}/myweb/images/${list.postImage}"
						alt="">
					</a>
					<div class="img-cap">
						<span>Add to cart</span>
					</div>
					<div class="favorit-items">
						<a href="#" style="color:black"><span class="flaticon-heart"></span></a>
					</div>
				</div>
				<div class="popular-caption">
					<h3>${list.title}</h3>

					<h3>
						<span>${list.nowPrice}</span>
					</h3>

				</div>
			</div>
		</div>
	</c:forEach>

	<table border="1">
		<tr>
			<th>넘버</th>
			<th>제품사진</th>
			<th>제목</th>
			<th>제품명</th>
			<th>현재가</th>
			<th>종료시간</th>
			<th>판매자아이디</th>
			<th>판매자이름</th>
		</tr>
		<c:forEach items="${postVOList}" var="list">
			<tr>
				<td><a
					href="${pageContext.request.contextPath}/user/productDetails?productNo=${list.productNo}">${list.productNo}</a></td>
				<td>${list.postImage}</td>
				<td>${list.title}</td>
				<td>${list.productName}</td>
				<td>${list.nowPrice}</td>
				<td>${list.bidEndTime}</td>
				<td>${list.memberVO.memberId}</td>
				<td>${list.memberVO.name}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<%-- 페이징 처리 --%>
<%-- ${requestScope.pagingBean} --%>
<c:set var="pb" value="${pagingBean}"></c:set>
<div class="pagingArea">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a style="color:black"
				href="${pageContext.request.contextPath}/user/showAll?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>
		<c:forEach var="page" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage==page}">
					<li class="active"><a style="color:black"
						href="${pageContext.request.contextPath}/user/showAll?pageNo=${page}">${page}</a></li>
				</c:when>
				<c:otherwise>
					<li><a style="color:black"
						href="${pageContext.request.contextPath}/user/showAll?pageNo=${page}">${page}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a style="color:black"
				href="${pageContext.request.contextPath}/user/showAll?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div>