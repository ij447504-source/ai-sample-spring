<!-- Parent: ../AI-CONTEXT.md -->

# board

## 목적

게시판(Board) 도메인 관련 모든 서버 측 코드를 포함합니다.

## 주요 파일

| 파일명 | 설명 |
| --- | --- |
| `Board.java` | 게시글 데이터 모델 (Entity) |
| `BoardController.java` | 게시글 관련 웹 요청 처리 (SSR) |
| `BoardRepository.java` | 데이터베이스와 상호작용하여 게시글 데이터를 관리 |
| `BoardRequest.java` | 게시글 생성 및 수정 요청 데이터 구조 (DTO) |
| `BoardResponse.java` | 게시글 조회 응답 데이터 구조 (DTO) |
| `BoardService.java` | 게시글 관련 비즈니스 로직 처리 |

## 하위 디렉토리

(없음)

## AI 작업 지침

- 새로운 게시판 기능을 추가할 경우, 이 디렉토리에 관련 파일을 생성합니다.
- `BoardService`는 `@Transactional(readOnly = true)`를 기본으로 하며, 쓰기 작업에는 `@Transactional`을 개별적으로 명시해야 합니다.
- Controller는 Entity를 직접 반환하지 않고, 항상 `BoardResponse` DTO를 사용해야 합니다.

## 테스트

- `src/test/java/com/example/demo/board` 경로에 테스트 코드를 추가하여 기능을 검증합니다.

## 의존성

- 내부: `_core`, `user` (작성자 정보)
- 외부: `Spring Web`, `Spring Data JPA`, `Lombok`, `Mustache`
