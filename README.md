# 🏆 Gold Auction System - Business Component Development 1

This project is a **multi-module enterprise web application** for conducting real-time online auctions for gold items. It was developed as an assignment for the *Business Component Development 1* subject at university.

![Gold Auction System Screenshot](https://github.com/saumya-sewmini/Gold-Auction/blob/66937dd330bf25c629ad8255acf2ddf72db0e083/Screenshot%202025-08-02%20013819.png)

---

## 🔍 Analysis of the Scenario

### 📝 Requirements Articulation

The system is designed for **real-time gold bidding** with the following requirements:

#### ✅ Functional Requirements
- Display available products for bidding.
- Allow users to place manual bids.
- Enable auto-bid with a maximum limit.
- Increase bids in fixed increments (e.g., Rs. 50).

#### ⚙️ Non-Functional Requirements
- **Concurrency Handling**: Multiple users should be able to place bids simultaneously.
- **Real-Time Updates**: Bid updates broadcast via WebSocket.
- **Reliability**: Consistent and stable under concurrent usage.
- **Scalability**: Easy to expand with more products or users.

> **Technologies Used**: Java EE (EJB, JMS, WebSocket), Payara Server

---

## 🧩 Key Component Identification

### 🧠 StoredDataSessionBean (@Singleton)
- Shared in-memory data (products, bids, auto-bid settings).
- Thread-safe access across sessions.

### 🛠 BidManagerBean (@Stateless)
- Validates and saves bids.
- Sends messages to JMS Topic for real-time update broadcasting.

### 🌐 BidServlet
- Handles bid submissions from users.
- Delegates logic to `BidManagerBean`.

### 🤖 AutoBidServlet
- Accepts user rules for auto-bidding.
- Stores configurations for background bidding.

### 📢 BidBroadcaster (WebSocket)
- Pushes bid updates to connected users instantly.

### 💬 JMS Topic (`jms/MyTopic`)
- Decouples EJB logic from WebSocket broadcasting.
- Ensures asynchronous, scalable communication.

---

## ⚠️ Challenges & Mitigation

| Challenge                        | Solution                                                                 |
|----------------------------------|--------------------------------------------------------------------------|
| Data Consistency                 | Singleton EJB with synchronized logic                                    |
| Concurrency Management           | Container-managed concurrency in EJB                                     |
| Performance Under Load           | JMS + WebSocket for async updates, reduces delay                         |
| Auto-Bid Even When Offline       | Stored auto-bid rules trigger automatically on new bids                  |
| Session Scalability              | Stateless servlets + cluster-ready deployment on Payara                  |

---

## 🏗 Design of the EJB Solution

### 🏛 Architectural Design

Multi-module EAR structure:
- `core` – Java model classes (Bid, Product, User)
- `ejb` – Business logic (Session Beans, Listeners)
- `web` – Servlets, WebSocket endpoints, JSPs
- `ear` – Packaging for deployment

**Bid Flow Overview:**
1. User places bid → `BidServlet`
2. Validated using `StoredDataSessionBean`
3. Saved via `BidManagerBean`
4. JMS message published → `jms/MyTopic`
5. Message consumed by `BidListenerMDB`
6. WebSocket broadcasts update to all clients

---

### 🔧 Component Design

- **BidManagerBean**: Stateless EJB to process bids & send JMS messages.
- **StoredDataSessionBean**: Singleton EJB storing product and auto-bid data.
- **AutoBidModel / BidModel**: POJOs for bid-related data.
- **JMS + WebSocket**: Combines async processing + instant frontend updates.
- **AutoBidServlet**: Automatically places valid bids based on user config.

---

## ⚙ Functional Design

### ✅ Bid Validation
- Bid amount must be greater than current max.
- Must follow Rs. 50 increments.

### 🔁 Auto-Bidding
- System places bids up to user’s limit if current bid changes.

### 📡 Real-Time Bid Broadcast
- Bids sent to JMS Topic → WebSocket → pushed to clients.

### 💻 Load Testing
- Simulated with multiple browser tabs.
- Logs confirmed bid correctness and real-time updates.

---

## 🧱 Usage of Enterprise Application Model

- Modules can run on different servers.
- `ejb` can be scaled independently.
- JMS & WebSocket decouple load from frontend.
- Supports future enhancements (e.g., user notifications, payment).

---

## 🚀 Usage of Containers & Connectors

- **EJB Container** (Payara): Handles lifecycle, pooling, transactions.
- **JMS Resources**:
  - `jms/MyTopic`: Broadcast bid messages.
  - `jms/MyConnectionFactory`: Creates JMS contexts.
- **WebSocket Server**: Sends bid updates to all viewers in real time.

---

## 🎯 Benefits of EJB Component Model

| Feature                  | Advantage in Project                                      |
|--------------------------|-----------------------------------------------------------|
| Stateless Beans          | Reusable for all users → ideal for high traffic           |
| Transactions             | Prevents broken updates when storing bids                 |
| Singleton Beans          | Ensures synchronized access to shared data                |
| Container Services       | Handles concurrency, pooling, lifecycle automatically     |


