package com.jcww.training.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Config {
    @Bean
    DirectExchange Exchange(){
        return new DirectExchange("direct.no.exchange");
    }

    @Bean
    Queue Queue(){
        return new Queue("direct.no.queue");
    }

    @Bean
    Binding noBinding(){
        return BindingBuilder.bind(Queue()).to(Exchange()).with("direct.routing.key.name");
    }
}
