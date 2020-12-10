package websocket;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

/*
웹소켓 서버의 요청명 지정(ws://호스트:포트번호/컨텍스트루트/ChatServer01)
 */
@ServerEndpoint("/ChatServer01")
public class ChatServer01 {

	//클라이언트가 접속했을때 처리
	@OnOpen
	public void onOpen() {
		System.out.println("연결되었습니다...");
	}
	
	//클라이언트와의 접속이 끊어졌을때 처리
	@OnClose
	public void onClose() {
		System.out.println("종료되었습니다...");
	}
	
	//클라이언트로부터 메세지가 도착했을때 처리
	@OnMessage
	public String onMessage(String message) {
		/*
			클라이언트로부터 메세지가 도착하면 로그를 출력하고
			다시 클라이언트로 Echo한다.
		 */
		System.out.println("Client메세지:"+ message);
		String echoMsg = "Server메세지:"+message;
		return echoMsg;
	}
	
	//채팅중 에러가 발생했을때 처리
	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}
}
