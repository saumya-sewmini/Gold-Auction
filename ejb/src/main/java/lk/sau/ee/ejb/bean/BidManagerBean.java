package lk.sau.ee.ejb.bean;

import com.google.gson.Gson;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.Resource;
import jakarta.ejb.EJB;
import jakarta.ejb.Singleton;
import jakarta.ejb.Startup;
import jakarta.jms.ConnectionFactory;
import jakarta.jms.JMSContext;
import jakarta.jms.Topic;
import lk.sau.ee.core.model.BidModel;
import lk.sau.ee.core.websocket.BidBroadcaster;
import lk.sau.ee.ejb.remote.BidManagerRemote;
import lk.sau.ee.ejb.remote.StoredDataRemote;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Singleton
@Startup
public class BidManagerBean implements BidManagerRemote {

    @EJB
    StoredDataRemote storedDataRemote;

    @Resource(lookup = "jms/MyConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/MyTopic")
    private Topic topic;

    private List<BidModel> bids;

    @PostConstruct
    public void init(){
        bids = new ArrayList<>();
    }

    @Override
    public void addBid(BidModel bid) {
        //save in memory
        bids.add(bid);

        //send to jms
        try (JMSContext context = connectionFactory.createContext()){
            String bidJson = new Gson().toJson(bid);
            context.createProducer().send(topic, bidJson);
            System.out.println("Bid sent to JMS topic" + bidJson);

        } catch (Exception e) {
            System.err.println("Failed to send bid to JMS topic: " + e.getMessage());
        }
    }

    @Override
    public List<BidModel> getBidsForProduct(int productId) {
        return bids.stream()
                .filter(b -> b.getItemId() == productId)
                .collect(Collectors.toList());
    }
}
