<!-- Parent: ../AI-CONTEXT.md -->

# reply

## 목적

댓글(Reply) 도메인 관련 모든 서버 측 코드를 포함합니다.

## 주요 파일

| 파일명 | 설명 |
| --- | --- |
| `Reply.java` | 댓글 데이터 모델 (Entity) |
| `ReplyController.java` | 댓글 관련 웹 요청 처리 (SSR) |
| `ReplyRepository.java` | 데이터베이스와 상호작용하여 댓글 데이터를 관리 |
| `ReplyRequest.java` | 댓글 생성 및 수정 요청 데이터 구조 (DTO) |
| `ReplyResponse.java` | 댓글 조회 응답 데이터 구조 (DTO) |
| `ReplyService.java` | 댓글 관련 비즈니스 로직 처리 |

## 하위 디렉토리

(없음)

## AI 작업 지침

- 댓글 기능 수정 또는 추가 시 이 디렉토리의 파일을 수정합니다.
- `ReplyService`는 `@Transactional(readOnly = true)`를 기본으로 하며, 쓰기 작업에는 `@Transactional`을 개별적으로 명시해야 합니다.
- `Reply`는 `Board` 및 `User`와 연관 관계를 가집니다. FetchType은 LAZY로 유지해야 합니다.

## 테스트

- `src/test/java/com/example/demo/reply` 경로에 테스트 코드를 추가하여 기능을 검증합니다.

## 의존성

- 내부: `_core`, `user`, `board`
- 외부: `Spring Web`, `Spring Data JPA`, `Lombok`, `Mustache`
