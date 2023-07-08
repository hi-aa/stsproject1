<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
	<jsp:include page="./layout/head.jsp"/>

	<script>
		$(document).ready(function() {
			clickMenu('/main');

		});

		/* url 링크 이등 */
		function linkUrl(url) {
			if(!url) {
				return;
			}

			location.href = url;
		}

		/* 메뉴 클릭 */
		function clickMenu(url) {
			if(!url) {
				return;
			}

			$.ajax({
				url: url
				, type: 'get'
				, dataType: 'html'
				, success: function(res){
					$("main").html(res);
				}
			});
		}

		/* 메뉴바 토글 */
		function clickMenuBar() {
			$("nav").toggleClass("responsive");
		}
	</script>

	<body>
		<jsp:include page="./layout/header.jsp"/>
		<!-- <nav>
			<a class="active" href="javascript:void(0);" onclick="clickMenu('/main')">Home</a>
			<a href="javascript:void(0);" onclick="clickMenu('/news')">News</a>
			<a href="javascript:void(0);" onclick="clickMenu('/contact')">Contact</a>
			<a href="javascript:void(0);" onclick="clickMenu('/about')">About</a>
			<a href="javascript:void(0);" class="icon" onclick="clickMenuBar();">
				<i class="fa fa-bars"></i>
			</a>
		</nav -->

		<main>
		</main>

		<jsp:include page="./layout/footer.jsp"/>
	</body>
</html>