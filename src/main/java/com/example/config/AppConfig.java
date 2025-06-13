// src/main/java/com/example/config/AppConfig.java
package com.example.config;

public class AppConfig {

    // Database Configuration
    public static final String DATABASE_URL = getEnvOrDefault("DATABASE_URL", "jdbc:mysql://localhost:3306/myapp");
    public static final String DATABASE_DRIVER = getEnvOrDefault("DATABASE_DRIVER", "com.mysql.cj.jdbc.Driver");
    public static final String DATABASE_PASSWORD = getEnvOrDefault("DATABASE_PASSWORD", "");

    // Application Configuration
    public static final String APP_ENVIRONMENT = getEnvOrDefault("APP_ENVIRONMENT", "development");
    public static final String LOG_LEVEL = getEnvOrDefault("LOG_LEVEL", "INFO");
    public static final String SERVER_PORT = getEnvOrDefault("SERVER_PORT", "8080");

    // External Services
    public static final String API_BASE_URL = getEnvOrDefault("API_BASE_URL", "http://localhost:3000");
    public static final String REDIS_HOST = getEnvOrDefault("REDIS_HOST", "localhost");
    public static final String REDIS_PORT = getEnvOrDefault("REDIS_PORT", "6379");

    // Feature Flags
    public static final boolean ENABLE_DEBUG_MODE = Boolean.parseBoolean(getEnvOrDefault("ENABLE_DEBUG_MODE", "false"));
    public static final boolean ENABLE_CACHE = Boolean.parseBoolean(getEnvOrDefault("ENABLE_CACHE", "true"));

    private static String getEnvOrDefault(String key, String defaultValue) {
        String value = System.getenv(key);
        return value != null ? value : defaultValue;
    }

    // Metodi di utilità
    public static boolean isProduction() {
        return "production".equalsIgnoreCase(APP_ENVIRONMENT);
    }

    public static boolean isDevelopment() {
        return "development".equalsIgnoreCase(APP_ENVIRONMENT);
    }

    public static boolean isStaging() {
        return "staging".equalsIgnoreCase(APP_ENVIRONMENT);
    }
}
