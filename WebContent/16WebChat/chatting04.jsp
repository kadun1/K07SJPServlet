<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting2.jsp</title>
</head>
<body>
<link rel="stylesheet" href="css/default.css"/>
<div id="chat-wrapper">
	<header id="chat-header">
		<h1>채팅창 - KOSMO1강의실</h1>
	</header>		
	<input type="hid-den" id="chat_id" value="${param.chat_id }" style="border:1px dotted red;" />
	<div id="chat-container" class="chat-area" style="height:500px;overflow:auto;">
		<!-- 왼쪽 채팅 -->
		<!-- <div class="chat chat-left">			
			<span class="profile profile-img-b"></span>
			<div class="chat-box">
				<p style="font-weight:bold;font-size:1.1em;margin-bottom:5px;">미르</p>
				<p class="bubble">낙자<br/>뭐해?</p>
				<span class="bubble-tail"></span>
			</div>
		</div> -->
		<!-- 오른쪽 채팅 -->
		<!-- <div class="chat chat-right">			
			<span class="profile profile-img-a"></span>
			<div class="chat-box">				
				<p class="bubble-me">그냥 쉬고있는 중ㅋ</p>
				<span class="bubble-tail"></span>
			</div> -->
		</div>
	</div>
	<footer id="chat-footer">		
		<p class="text-area">
			<!-- 메세지 입력창 -->
			<input type="text" id="inputMessage" onkeyup="enterkey();"
				style="width:450px; height:60px; font-size:1.5em; border:0px;" />
			<button type="button" onclick="sendMessage();">보내기</button>
		</p>
	</footer>
</div>
</body>

<script type="text/javascript">
	
	var messageWindow;
	var inputMessage;
	var chat_id;
	var webSocket; 
	window.onload = function(){
		
		//대화가 디스플레이 되는 영역
		messageWindow = document.getElementById("chat-container");
		
		//대화영역의 스크롤바를 항상 아래로 내려준다
		messageWindow.scrollTop = messageWindow.scrollHeight;
		//메세지 입력부분
		inputMessage = document.getElementById('inputMessage');
		//채팅아이디
		chat_id = document.getElementById('chat_id').value;
		
		webSocket = new WebSocket('ws://localhost:9999/K07JSPServlet/ChatServer02');
		webSocket.onopen = function(event){
			wsOpen(event);
		};
		webSocket.onmessage = function(event){
			wsMessage(event);
		};
		webSocket.onclose = function(event){
			wsClose(event);
		};
		webSocket.onerror = function(event){
			wsError(event);
		};
	}
	function wsOpen(event){
		messageWindow.value += "연결성공\n";
	}
	
	function wsMessage(event){
		var message = event.data.split("|");
		var sender = message[0];
		var content = message[1];
		var msg;
		
		if (content ==""){
			//내용없으므로 아무것도 하지않는다.
		}
		else {
			//내용에 /가 있다면 귓속말이므로...
			if(content.match("/")){
				//해당 아이디(닉네임)에게만 디스플레이 한다.
				if(content.match(("/"+chat_id))){
					var temp = content.replace(("/"+chat_id),"[귓속말]:");
					msg = makeBalloon(sender, temp);
					messageWindow.innerHTML += msg;
					//대화영역의 스크롤바를 항상 아래로 내려준다.
					messageWindow.scrollTop = messageWindow.scrollHeight;					
				}
			}
			else{
				//귓속말이 아니면 모두에게 디스플레이
				msg = makeBalloon(sender, content);
				messageWindow.innerHTML += msg;
				//대화영역의 스크롤바를 항상 아래로 내려준다.
				messageWindow.scrollTop = messageWindow.scrollHeight;					
			}
		}
	}
	
	//상대방이 보낸 메세지를 출력하기 위한 부분
	function makeBalloon(id, cont){
		var msg = '';
		msg += '<div class="chat chat-left">';
		msg += ' <!-- 프로필 이미지 -->';
		msg += ' 	<span class="profile profile-img-b"></span>';
		msg += ' 	<div class="chat-box">';
		msg += '		<p style="font-weight:bold; font-size:1.1em; margin-bottom:5px;">'+id+'</p>';
		msg += ' 		<p class="bubble">'+cont+'</p>';
		msg += ' 	<span class="bubble-tail"></span>';
		msg += ' </div>';
		msg += '</div>';
		return msg;
	}
	
	function wsClose(event){
		messageWindow.value += "연결끊기성공\n";
	}
	function wsError(event){
		alert(event.data);
	}
	
	function sendMessage(){
		//웹소켓 서버로 대화내용을 전송한다
		webSocket.send(chat_id+'|'+inputMessage.value);
		
		//내가 보낸 내용에 UI를 적용한다.
		var msg = '';
		msg += '<div class="chat chat-right">';
		msg += ' 	<!-- 프로필 이미지 -->';
		msg += ' 	<span class="profile profile-img-a"></span>';
		msg += ' 	<div class="chat-box">';
		msg += ' 		<p class="bubble-me">'+inputMessage.value+'</p>';
		msg += ' 		<span class="bubble-tail"></span>';
		msg += ' 	</div>';
		msg += ' </div>';
		
		messageWindow.innerHTML += msg;
		inputMessage.value = "";
		//대화영역의 스크롤바를 항상 아래로 내려준다.
		messageWindow.scrollTop = messageWindow.scrollHeight;						
	}
	
	function enterkey(){
		/*
		키보드를 눌렀다가 뗐을때 호출되며, 눌러진 키보드의
		키코드가 13일때, 즉 엔터키일때 아래 함수를 즉시 호출한다.
		*/
		if(window.event.keyCode==13){
			sendMessage();
		}
	}
</script>
</html>





