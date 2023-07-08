<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style>
* {
	box-sizing: border-box
}

/* Slideshow container */
.slideshow-container {
	position: relative;
	/* max-width: 1000px;
	margin: auto; */
}

/* Hide the images by default */
.slides {
	display: none;
}
.slides img {
	width: 100%;
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
	$(document).ready(function() {
		initSlide();

		window.addEventListener('beforeunload', (e) => {
			e.preventDefault();
			slideController.stop();
		});
	});

	var slideController = {
		setup: function() {
			this.cycle = 3000;
		},
		show: function(index) {
			this.slideIndex = index; // 인덱스 지정
			let slides = $(".slideshow-container .slides");

			if(!this.slideIndex) {
				this.slideIndex = 0;
			} else if(this.slideIndex > slides.length - 1) { // next
				this.slideIndex = 0;
			} else if(this.slideIndex < 0) { // prev
				this.slideIndex = slides.length - 1;
			}
			console.info('show>> ', this.slideIndex);

			slides.css("display", "none");
			slides.eq(this.slideIndex).css("display", "block");
		},
		showAuto: function(index) {
			if(!index) {
				index = 0;
			}
			this.show(index);

			this.timeoutId = setInterval(() => {
				let index = this.slideIndex;
				this.show(++index);
			}, this.cycle);
		},
		showPrev: function() {
			this.show(--this.slideIndex);
		},
		showNext: function() {
			this.show(++this.slideIndex);
		},
		stop: function() {
			console.info('stop');
			clearInterval(this.timeoutId);
		},
		// 슬라이드 추가
		appendSlide: function(src, text) {
			// clone and append slide
			let container = $(".slideshow-container .slide-container");
			container.append($(".slide-template .slides").clone());

			// set data
			let appendedSlide = $(".slideshow-container .slides").last();
			appendedSlide.find(".numbertext").text();
			appendedSlide.find("img").attr("src", src);
			appendedSlide.find(".text").text(text);
		}
	};

	/* 메인화면 배너 생성 */
	function initSlide() {
		$.ajax({
			url: '/api/getBannerList'
			, type: 'get'
			, data: {'bannerType' : 'MAIN'}
			, success: function(res){
				console.log(res);

				if(res != null && res.length > 0) {
					slideController.setup();

					// 슬라이드 생성
					res.forEach((v, i) => {
						slideController.appendSlide(v.filePath + v.fileNm , 'caption ' + i);
					});

					// 슬라이드 시작
					slideController.showAuto();
				}
			}
		});
	}
</script>

<div>
	<div class="slideshow-container">
		<!-- slide 추가 영역 -->
 		<div class="slide-container">

 		</div>
		<!-- //slide 추가 영역 -->
		<a class="prev" onclick="slideController.showPrev()">&#10094;</a>
		<a class="next" onclick="slideController.showNext()">&#10095;</a>
	</div>
	<div class="slide-template" style="diplay:none;">
		<!-- 슬라이드 추가 시 사용 -->
		<div class="slides fade">
			<div class="numbertext"></div>
			<img src="">
			<div class="text"></div>
		</div>
	</div>

	<div class="block" style="font-size: 20px;">
		텍스트1 텍스트2 텍스트3
	</div>
</div>