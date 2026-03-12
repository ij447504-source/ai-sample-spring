<!-- Parent: ../AI-CONTEXT.md -->

# user

## 목적

사용자(User) 도메인 관련 모든 서버 측 코드를 포함합니다.

## 주요 파일

| 파일명 | 설명 |
| --- | --- |
| `User.java` | 사용자 데이터 모델 (Entity) |
| `UserController.java` | 사용자 관련 웹 요청(회원가입, 로그인 등) 처리 |
| `UserRepository.java` | 데이터베이스와 상호작용하여 사용자 데이터를 관리 |
| `UserRequest.java` | 사용자 관련 요청 데이터 구조 (DTO) |
| `UserResponse.java` | 사용자 관련 응답 데이터 구조 (DTO) |
| `UserService.java` | 사용자 관련 비즈니스 로직(인증 등) 처리 |

## 하위 디렉토리

(없음)

## AI 작업 지침

- 인증 로직은 `HttpSession`을 사용하여 구현합니다. Spring Security는 현재 사용하지 않습니다.
- 모든 비밀번호는 저장 전 `PasswordEncoder`를 통해 해싱되어야 합니다. (현재는 구현되지 않았을 수 있음)
- `UserService`에서 DTO 변환을 책임지며, Controller에는 절대로 Entity를 노출하지 않습니다.

## 테스트

- `src/test/java/com/example/demo/user` 경로에 테스트 코드를 추가하여 기능을 검증합니다.

## 의존성

- 내부: `_core`
- 외부: `Spring Web`, `Spring Data JPA`, `Lombok`, `Mustache`
