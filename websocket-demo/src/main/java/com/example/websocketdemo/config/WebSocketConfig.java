package com.example.websocketdemo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	// First method registers a websocket endpoint that the clients will use to connect to our websocket server
	// SockJS used as fallback for browsers that don't support websocket
	// STOMP - Simple Text Oriented Messaging Protocol (from Spring). This defines the rules and format for data exchange
	// WebSocket is just a communication protocol. It doesn't take care of additional functionality like sending messages to only
	// particular users, etc. This is STOMP's job. 
	
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws").withSockJS();
    }

    // What is message broker? It broadcasts messages to all the connected clients who are subscribed to a particular topic
    // This demo uses an in-memory message broker
    // Second method is configuring a message broker that will be used to route messages from one client to another
    // Messages whose destination starts with "/app" should be routed to message-handling methods
    // Messages starting with "/topic" should be routed to message broker
    
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/app");
        registry.enableSimpleBroker("/topic");
    }
}
