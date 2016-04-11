<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>视频播放</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<style type="text/css">
			body {
				background-color: black;
				text-align: center;
			}
			video {margin: 0 auto;}
		</style>
	</head>
<body>
	<video width="1000px" height="600px" controls preload="auto">
			<source src="http://img.alinetgo.com${video.videoPath}" type="video/mp4">
	</video>
</body>
</html>