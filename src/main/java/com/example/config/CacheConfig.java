package com.example.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;

import java.time.Duration;

@Configuration
@EnableCaching
//public class CacheConfig extends CachingConfigurerSupport {
public class CacheConfig {
    @Bean
    public JedisConnectionFactory jedisConnectionFactory() {
        return new JedisConnectionFactory();
    }

    @Bean
    public CacheManager cacheManager() {
        RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig()
                .entryTtl(Duration.ofHours(1))
                .disableCachingNullValues();
        return RedisCacheManager.builder(jedisConnectionFactory()).cacheDefaults(config).build();
    }

//    @Bean
//    public CacheManager cacheManager() {
//        SimpleCacheManager cacheManager = new SimpleCacheManager();
//        cacheManager.setCaches(Arrays.asList(
//                new ConcurrentMapCache("employees"),
//                new ConcurrentMapCache("employee")));
//        return cacheManager;
//    }
}
