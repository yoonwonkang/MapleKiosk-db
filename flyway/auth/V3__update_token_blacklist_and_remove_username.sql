-- 테이블 이름 변경
ALTER TABLE token_blacklist RENAME TO token_black_list;

-- 컬럼 추가: token_black_list
ALTER TABLE token_black_list
    ADD COLUMN reason VARCHAR(50) NOT NULL DEFAULT 'logout',
    ADD COLUMN token_type VARCHAR(20) NOT NULL DEFAULT 'ACCESS',
    ADD COLUMN owner_id BIGINT;

-- 컬럼 삭제: shop.username
ALTER TABLE shop
    DROP COLUMN username;

-- 컬럼 삭제: kiosk.username
ALTER TABLE kiosk
    DROP COLUMN username;