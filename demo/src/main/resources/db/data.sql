-- 유저 더미 데이터
INSERT INTO user_tb (username, password, email, zipcode, address, detail_address, created_at) VALUES ('ssar', '1234', 'ssar@nate.com', '12345', '부산시 해운대구', '반여동', NOW());
INSERT INTO user_tb (username, password, email, zipcode, address, detail_address, created_at) VALUES ('cos', '1234', 'cos@nate.com', '54321', '부산시 진구', '서면', NOW());

-- 게시글 더미 데이터
INSERT INTO board_tb (title, content, user_id, created_at) VALUES ('첫 번째 게시글', '안녕하세요. ssar의 첫 번째 글입니다.', 1, NOW());
INSERT INTO board_tb (title, content, user_id, created_at) VALUES ('두 번째 게시글', '안녕하세요. ssar의 두 번째 글입니다.', 1, NOW());
INSERT INTO board_tb (title, content, user_id, created_at) VALUES ('세 번째 게시글', '안녕하세요. cos의 첫 번째 글입니다.', 2, NOW());

-- 댓글 더미 데이터
INSERT INTO reply_tb (comment, user_id, board_id, created_at) VALUES ('첫 번째 댓글입니다.', 2, 1, NOW());
INSERT INTO reply_tb (comment, user_id, board_id, created_at) VALUES ('두 번째 댓글입니다.', 1, 1, NOW());