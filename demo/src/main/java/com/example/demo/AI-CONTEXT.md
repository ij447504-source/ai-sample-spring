<!-- Parent: ../../../../../AI-CONTEXT.md -->

# demo

## 목적

이 애플리케이션의 주요 백엔드 소스 코드를 포함하는 최상위 패키지입니다.

## 주요 파일

| 파일명 | 설명 |
| --- | --- |
| `DemoApplication.java` | Spring Boot 애플리케이션의 메인 진입점입니다. |

## 하위 디렉토리

- `_core/` - 애플리케이션 전반에서 사용되는 핵심 유틸리티 및 설정 파일.
- `board/` - 게시판 도메인 관련 코드 (Entity, Controller, Service, Repository).
- `reply/` - 댓글 도메인 관련 코드.
- `user/` - 사용자 도메인 관련 코드.

## AI 작업 지침

- 새로운 도메인을 추가할 경우, 이 디렉토리 아래에 새로운 패키지를 생성합니다. (예: `product/`)
- 모든 도메인 패키지는 플랫 구조를 따라야 합니다. (예: `board` 패키지 안에 `service`, `controller` 등 하위 패키지를 만들지 않습니다.)
- 도메인 간 참조는 Service 레이어에서 발생하며, 순환 참조가 발생하지 않도록 주의해야 합니다.

## 테스트

- 통합 테스트는 `src/test/java/com/example/demo/DemoApplicationTests.java`에서 시작할 수 있습니다.
- 특정 도메인의 테스트는 해당 도메인 패키지 아래의 테스트 디렉토리에 위치합니다.

## 의존성

- 내부: 없음
- 외부: `Spring Boot`, `Spring Web`, `Spring Data JPA`
