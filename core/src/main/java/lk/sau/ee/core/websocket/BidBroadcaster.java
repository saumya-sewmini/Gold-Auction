package lk.sau.ee.core.websocket;

import jakarta.websocket.Session;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class BidBroadcaster {

    private static final Set<Session> sessions = ConcurrentHashMap.newKeySet();

    public static void register(Session session){
        sessions.add(session);
        System.out.println("Registered session");
    }

    public static void unregister(Session session){
        sessions.remove(session);
        System.out.println("Unregistered session");
    }

    public static void broadcast(String message) {
        for (Session session : sessions) {
            if (session.isOpen()) {
                session.getAsyncRemote().sendText(message);
                System.out.println("Sent message: " + message);
            }

        }
    }
}
