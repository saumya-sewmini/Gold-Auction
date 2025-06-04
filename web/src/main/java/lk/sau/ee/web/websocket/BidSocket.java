package lk.sau.ee.web.websocket;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import lk.sau.ee.core.websocket.BidBroadcaster;

@ServerEndpoint(value = "/bidSocket")
public class BidSocket {

    @OnOpen
    public void onOpen(Session session){
        BidBroadcaster.register(session);
        System.out.println("Connected");
    }

    @OnClose
    public void onClose(Session session){
        BidBroadcaster.unregister(session);
        System.out.println("Disconnected");
    }

}
