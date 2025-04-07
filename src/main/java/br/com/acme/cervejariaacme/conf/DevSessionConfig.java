package br.com.acme.cervejariaacme.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.session.MapSessionRepository;
import org.springframework.session.SessionRepository;

import java.util.concurrent.ConcurrentHashMap;

@Configuration
@Profile({"dev", "default"})
public class DevSessionConfig {
    @Bean
    public SessionRepository<?> sessionRepository() {
        System.out.println("Criando a session");
        return new MapSessionRepository(new ConcurrentHashMap<>());
    }
}
