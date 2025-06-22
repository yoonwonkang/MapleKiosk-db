plugins {
    java
    id("org.flywaydb.flyway") version "11.9.1"
}

group = "com.maplekiosk"
version = "1.0.0"

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.flywaydb:flyway-core:11.9.1")
    implementation("org.mariadb.jdbc:mariadb-java-client:3.3.2")
}

flyway {
    url = "jdbc:mariadb://localhost:3306/${System.getenv("DB_NAME")}"
    user = System.getenv("DB_USER")
    password = System.getenv("DB_PASSWORD")
}