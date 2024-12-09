-- 기본 데이터

-- BCryptPasswordEncoder - 암호화 시
-- 사용자
INSERT INTO users ( id, username, password, name )
VALUES ( UUID(), 'user', '$2a$12$TrN..KcVjciCiz.5Vj96YOBljeVTTGJ9AUKmtfbGpgc9hmC7BxQ92', '사용자' );

-- 관리자
INSERT INTO users ( id, username, password, name )
VALUES ( UUID(), 'admin', '$2a$12$TrN..KcVjciCiz.5Vj96YOBljeVTTGJ9AUKmtfbGpgc9hmC7BxQ92', '관리자' );

INSERT INTO users ( id, username, password, name )
VALUES ( UUID(), 'test', '$2a$12$TrN..KcVjciCiz.5Vj96YOBljeVTTGJ9AUKmtfbGpgc9hmC7BxQ92', '테스트' );



-- 권한
-- 사용자 
-- * 권한 : ROLE_USER
INSERT INTO user_auth ( id, username,  auth )
VALUES ( UUID(), 'user', 'ROLE_USER' );

INSERT INTO user_auth ( id, username,  auth )
VALUES ( UUID(), 'test', 'ROLE_USER' );

-- 관리자
-- * 권한 : ROLE_USER, ROLE_ADMIN
INSERT INTO user_auth ( id, username,  auth )
VALUES ( UUID(), 'admin', 'ROLE_USER' );

INSERT INTO user_auth ( id, username,  auth )
VALUES ( UUID(), 'admin', 'ROLE_ADMIN' );

-- PRODUCTS (메뉴)
INSERT INTO PRODUCTS (ID, OPTION_ID, NAME, CATEGORY_ID, DESCRIPTION, CONTENT, PRICE, STOCK_CHECK, STOCK, SEQ, CREATED_AT, UPDATED_AT)
VALUES
('1', '1', '김치찌개', '1', '매콤한 김치찌개', '신선한 재료로 만든 김치찌개', 8000, TRUE, 20, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('2', '1', '된장찌개', '1', '구수한 된장찌개', '전통 된장으로 만든 찌개', 7000, TRUE, 15, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('3', NULL, '불고기', '2', '달콤한 불고기', '국내산 소고기로 만든 불고기', 12000, TRUE, 10, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- CARTS (주문 대기)
INSERT INTO CARTS (ID, PRODUCTS_ID, USERS_ID, AMOUNT, PRICE, CREATED_AT, UPDATED_AT)
VALUES
('1', '1', '1' , 2, 16000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('2', '3', '1' , 1, 12000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ORDERS (주문)
INSERT INTO ORDERS (ID, USER_ID, TITLE, TOTAL_QUANTITY, TOTAL_COUNT, TOTAL_PRICE, STATUS, ORDERED_AT, CREATED_AT, UPDATED_AT)
VALUES
('1', '1', '테이블1 주문', 2, 2, 28000, 'PAID', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('2', '2', '테이블2 주문', 1, 1, 12000, 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ORDER_ITEMS (주문 항목)
INSERT INTO ORDER_ITEMS (ID, ORDERS_ID, PRODUCTS_ID, QUANTITY, PRICE, AMOUNT, CREATED_AT, UPDATED_AT)
VALUES
('1', '1', '1', 2, 8000, 16000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('2', '1', '3', 1, 12000, 12000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- PAYMENTS (결제)
INSERT INTO PAYMENTS (ID, ORDERS_ID, PAYMENT_METHOD, STATUS, PAID_AT, CREATED_AT, UPDATED_AT)
VALUES
('1', '1', '현금', 'PAID', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('2', '2', '카드', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- CATEGORIES (카테고리)
INSERT INTO CATEGORIES (ID, NAME, SEQ, CREATED_AT, UPDATED_AT)
VALUES
('1', '찌개류', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('2', '구이류', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- FILES (이미지)
INSERT INTO FILES (ID, PARENT_TABLE, PARENT_ID, NAME, ORIGIN_NAME, PATH, SIZE, IS_MAIN, SEQ, CREATED_AT, UPDATED_AT)
VALUES
('1', 'PRODUCTS', '1', 'kimchi_stew.jpg', '김치찌개.jpg', '/images/kimchi_stew.jpg', 500, TRUE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('2', 'PRODUCTS', '3', 'bulgogi.jpg', '불고기.jpg', '/images/bulgogi.jpg', 400, TRUE, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- NOTICES (공지사항)
INSERT INTO NOTICES (ID, thumbnail, TYPE, TITLE, CONTENT, CREATED_AT, UPDATED_AT)
VALUES
('1', '/images/event.jpg', '이벤트', '점심특선 할인', '11시~2시까지 10% 할인!', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- OPTIONS (옵션)
INSERT INTO OPTIONS (ID, NAME, STOCK_CHECK, STOCK, ESSENTIAL, SELECT_MIN, SELECT_MAX, CREATED_AT, UPDATED_AT)
VALUES
('1', '추가 밥', TRUE, 50, TRUE, 1, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- OPTION_ITEMS (옵션 항목)
INSERT INTO OPTION_ITEMS (ID, OPTION_ID, NAME, PRICE, SEQ, CREATED_AT, UPDATED_AT)
VALUES
('1', '1', '공기밥', 1000, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
