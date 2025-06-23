# 📂 MapleKiosk-DB

- This repository is a flyway based DB management for the MapleKiosk.
- It uses **MariaDB** running in Docker, and migrations are managed via a flyway docker
---

## Instruction

### ⚙️ 사전 준비 / Prerequisites
- Docker, Docker Compose install
- Create `.env` file
```
see .env.example
```

---

### 🐬 데이터베이스 실행 / Run Database
```bash
docker compose -f docker-compose.db.yml --env-file .env up -d
```

---

### 🛠️ flyway 실행 / Run flyway
```bash
docker compose -f docker-compose.flyway.yml --env-file .env run --rm flyway
```
**업데이트시 적용/Running this when DB update**

---

### 📦 마이그레이션 파일 작성 규칙 / How to naming migration file
- `flyway/sql/V%d__%s.sql` 형식으로 작성
- 예시: `V1__init.sql`, `V2__add_test_data.sql`

---

### 🔁 롤백 / How to rollback
- 자체 지원 안함 / Flyway OSS does **not support rollback**
- 매뉴얼 롤백 필요 추후 추가 예정 / Manual rollback SQL required, Will be added later
---

### 📂 폴더 구조
```text
.
├── docker-compose.db.yml
├── docker-compose.flyway.yml
├── flyway
│   └── sql
│       ├── V1__init.sql
│       └── (추가 마이그레이션 파일/additional migration)
├── mariadb
│   ├── data (DB 데이터/DB data)
│   └── my.cnf (DB 설정 파일/DB config)
└── README.md
```

---