<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style>
* {
	box-sizing: border-box
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Hide the images by default */
.slides {
	display: none;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	margin-top: -22px;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 10px;
	width: 10px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	animation-name: fade;
	animation-duration: 1.5s;
}

@keyframes fade {
	from {
		opacity:.4
	}
	to {
		opacity: 1
	}
}
</style>

<script>
	const slideController = {
		setup() {
			this.cycle = 2000;
		},
		show(index) {
			this.slideIndex = index; // 인덱스 지정
			let slides = $(".slideshow-container .slides");

			if(!this.slideIndex || this.slideIndex > slides.length - 1) {
				this.slideIndex = 0;
			}
			console.info('show>> ', this.slideIndex);

			slides.css("display", "none");
			slides.eq(this.slideIndex).css("display", "block");
		},
		showAuto(index) {
			if(!index) {
				index = 0;
			}
			this.show(index);

			this.timeoutId = setInterval(() => {
				let index = this.slideIndex;
				this.show(++index);
			}, this.cycle);
		},
		stop() {
			console.info('stop');
			clearInterval(this.timeoutId);
		}
	};

	$(document).ready(function() {
		slideController.setup();
		//showSlides();
		getSlideInfo();
	});

	/* 슬라이드 정보 얻기 */
	function getSlideInfo() {
		$.ajax({
			url: '/api/getBannerList'
			, type: 'get'
			, success: function(res){
				console.log(res);
			}
		});
	}

	/* 자동 슬라이드 */
//	function showSlides() {
//		slideController.showAuto();
//	}

	/* 슬라이드 변경 */
	function changeSlide(index) {
		slideController.stop();
		slideController.showAuto(index);
	}
</script>

<div>
	<!-- Slideshow container -->
	<div class="slideshow-container">
		<!-- Full-width images with number and caption text -->
		<div class="slides fade">
			<div class="numbertext">1 / 3</div>
			<img src="/resources/img/main1.jpg" style="width: 100%">
			<div class="text">Caption One</div>
		</div>

		<div class="slides fade">
			<div class="numbertext">2 / 3</div>
			<img src="/resources/img/main2.jpg" style="width: 100%">
			<div class="text">Caption Two</div>
		</div>

		<div class="slides fade">
			<div class="numbertext">3 / 3</div>
			<img src="/resources/img/main3.jpg" style="width: 100%">
			<div class="text">Caption Three</div>
		</div>

		<!-- Next and previous buttons -->
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>
	</div>
	<!-- //Slideshow container -->

	<!-- The dots/circles -->
	<div style="text-align: center">
		<span class="dot" onclick="changeSlide(0)"></span>
		<span class="dot" onclick="changeSlide(1)"></span>
		<span class="dot" onclick="changeSlide(2)"></span>
	</div>
	<!-- //The dots/circles -->
</div>