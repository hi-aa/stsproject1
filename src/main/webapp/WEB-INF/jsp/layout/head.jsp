<head>
<meta charset="utf-8">
<title>Test Project</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	width: 100%;
	min-height: 100%;
	position: relative;
	font-family: Arial, Helvetica, sans-serif;
}

header {
/* background-color: #dbedf8;
	height: 80px; */
	display: none;
}

nav {
	overflow: hidden;
	background-color: #333;
	position: fixed;
	top: 0;
	width: 100%;
}
nav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}
nav a:hover {
	background-color: #ddd;
	color: black;
}
nav a.active {
	background-color: #04AA6D;
	color: white;
}
nav .icon {
	display: none;
}
/* nav responsive */
@media screen and (max-width: 600px) {
	nav a:not(:first-child) {
		display: none;
	}
	nav a.icon {
		float: right;
		display: block;
	}
}
@media screen and (max-width: 600px) {
	nav.responsive {
		position: relative;
	}
	nav.responsive .icon {
		position: absolute;
		right: 0;
		top: 0;
	}
	nav.responsive a {
		float: none;
		display: block;
		text-align: left;
	}
}

main {
	margin-top: 50px;
}

footer {
	/* background-color: #abcce0;
	position: absolute;
	width: 100%; height: 40px;
	bottom: 0; left: 0; */
	display: none;
}
</style>
</head>