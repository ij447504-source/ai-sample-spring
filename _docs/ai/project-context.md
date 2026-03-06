# 프로젝트 컨텍스트: 블로그 애플리케이션

## 1. 프로젝트 개요

본 프로젝트는 Spring Boot를 사용하여 블로그 서비스를 개발하는 것을 목표로 합니다. 사용자는 회원가입 및 로그인을 할 수 있으며, 게시글을 작성하고 댓글을 통해 다른 사용자와 소통할 수 있습니다.

- **프로젝트명**: Spring Boot Blog
- **저장소**: `c:\workspace\spring_lab2`
- **주요 기능**: 사용자 관리, 게시글 관리, 댓글 관리

## 2. 기술 스택

이 프로젝트는 다음과 같은 기술 스택을 기반으로 구축되었습니다.

- **언어**: Java 21
- **프레임워크**: Spring Boot 4.0.3
- **데이터베이스**: H2 (In-Memory)
- **ORM**: Spring Data JPA
- **빌드 도구**: Gradle
- **템플릿 엔진**: Mustache
- **라이브러리**:
  - `Lombok`: 보일러플레이트 코드 감소
  - `Spring Boot Devtools`: 개발 편의성 향상
- **테스팅**: JUnit 5

## 3. 프로젝트 아키텍처

### 3.1. 계층형 아키텍처 (Layered Architecture)

프로젝트는 Presentation, Business, Persistence 세 가지 주요 계층으로 구성된 전형적인 계층형 아키텍처를 따릅니다.

- **Presentation Layer (`*Controller.java`)**: HTTP 요청을 수신하고 응답을 반환합니다. 클라이언트의 요청을 적절한 서비스 메서드로 라우팅하고, 서비스의 처리 결과를 HTTP 응답(HTML 또는 JSON)으로 변환합니다.
- **Business Layer (`*Service.java`)**: 핵심 비즈니스 로직을 처리합니다. 트랜잭션 관리 및 도메인 모델 간의 상호작용을 담당합니다.
- **Persistence Layer (`*Repository.java`)**: 데이터베이스와 상호작용합니다. Spring Data JPA를 사용하여 데이터의 CRUD(Create, Read, Update, Delete) 작업을 수행합니다.

### 3.2. 패키지 구조

코드는 도메인(기능)을 기준으로 패키지화되어 있습니다. 이를 통해 각 기능의 독립성을 높이고 코드의 응집도를 강화합니다.

```
com.example.demo
├───_core       # 프로젝트 전역에서 사용되는 유틸리티 및 설정
│   └───utils
│       └───Resp.java  # 공통 응답 DTO
├───user        # 사용자 도메인
│   ├───User.java
│   ├───UserController.java
│   ├───UserService.java
│   └───UserRepository.java
├───board       # 게시글 도메인
│   └─── ...
└───reply       # 댓글 도메인
    └─── ...
```

### 3.3. 아키텍처 관련 노트

- `Board.java` 엔티티의 `user` 필드가 `FetchType.EAGER`로 설정되어 있습니다. 이는 N+1 문제를 유발할 수 있으므로, 주석(`// RULE : 모든 연간관계는 Lazy로 한다`)에 명시된 대로 `FetchType.LAZY`로 변경하고 필요한 경우에만 fetch join을 사용하는 것을 권장합니다.

## 4. 데이터베이스 스키마

JPA 엔티티를 기반으로 한 데이터베이스 스키마는 다음과 같습니다.

- **`user_tb`**
  - `id` (PK)
  - `username` (UNIQUE)
  - `password`
  - `email`
  - `created_at`

- **`board_tb`**
  - `id` (PK)
  - `title`
  - `content`
  - `user_id` (FK to `user_tb`)
  - `created_at`

- **`reply_tb`**
  - `id` (PK)
  - `comment`
  - `user_id` (FK to `user_tb`)
  - `board_id` (FK to `board_tb`)
  - `created_at`

**관계:**
- `User` ↔ `Board` (1:N)
- `User` ↔ `Reply` (1:N)
- `Board` ↔ `Reply` (1:N)

## 5. 제안 API 엔드포인트

현재 컨트롤러는 초기 단계에 있지만, 일반적인 블로그 기능을 위한 RESTful API 엔드포인트는 다음과 같이 설계할 수 있습니다.

| Method | URI                               | 설명               |
|--------|-----------------------------------|--------------------|
| **User** |                                   |                    |
| `POST` | `/join`                           | 회원가입           |
| `POST` | `/login`                          | 로그인             |
| `GET`  | `/logout`                         | 로그아웃           |
| `GET`  | `/users/{id}`                     | 회원 정보 조회     |
| **Board** |                                   |                    |
| `POST` | `/boards`                         | 게시글 작성        |
| `GET`  | `/boards`                         | 게시글 목록 조회   |
| `GET`  | `/boards/{id}`                    | 게시글 상세 조회   |
| `PUT`  | `/boards/{id}`                    | 게시글 수정        |
| `DELETE`| `/boards/{id}`                    | 게시글 삭제        |
| **Reply** |                                   |                    |
| `POST` | `/boards/{boardId}/replies`       | 댓글 작성          |
| `GET`  | `/boards/{boardId}/replies`       | 특정 글의 댓글 목록|
| `DELETE`| `/replies/{id}`                   | 댓글 삭제          |

## 6. 실행 방법

1.  Gradle을 사용하여 프로젝트를 빌드합니다: `./gradlew build`
2.  Spring Boot 애플리케이션을 실행합니다: `./gradlew bootRun`
3.  웹 브라우저에서 `http://localhost:8080/home` 에 접속하여 홈 페이지를 확인합니다.
4.  H2 데이터베이스 콘솔은 `http://localhost:8080/h2-console` 에서 접근할 수 있습니다. (JDBC URL: `jdbc:h2:mem:testdb`)
