# 스킬: Java Spring 프로젝트 코드 스타일

이 스킬은 현재 Spring Boot 프로젝트의 코드 스타일과 규칙을 정의합니다. Java 파일을 수정하거나 생성할 때, 다음 규칙을 반드시 준수해야 합니다.

## 1. 파일 및 패키지 구조

- **기능별 그룹화:** 단일 기능(예: `user`, `board`)과 관련된 모든 코드는 자체 패키지(`com.example.demo.{feature}`) 내에 위치해야 합니다.

## 2. 이름 규칙 (Naming Conventions)

- **클래스:** `PascalCase`를 사용합니다.
- **메서드 및 변수:** `camelCase`를 사용합니다.
- **도메인 특화 클래스:** 다음의 접미사(suffix) 패턴을 따릅니다:
  - Entity: `{Domain}` (예: `User`, `Board`)
  - Controller: `{Domain}Controller`
  - Service: `{Domain}Service`
  - Repository: `{Domain}Repository`
  - Request DTOs: `{Domain}Request`
  - Response DTOs: `{Domain}Response`
- **데이터베이스 테이블:** `snake_case`를 사용하고 `_tb` 접미사를 붙입니다 (예: `user_tb`, `board_tb`). `@Table(name = "...")` 어노테이션으로 이를 정의합니다.

## 3. 클래스 구현 규칙

### 3.1. 일반

- **Lombok 사용:** Boilerplate 코드를 줄이기 위해 Lombok을 적극적으로 사용합니다.
  - DTO와 Entity에는 `@Data`를 사용합니다.
  - Entity에는 `@NoArgsConstructor`를 사용합니다.
  - Service와 Controller의 생성자 주입에는 `@RequiredArgsConstructor`를 사용합니다.
  - Entity에는 `@Builder`를 사용합니다.
- **의존성 주입:** 항상 생성자 주입을 사용합니다. 필드를 `final`로 선언하고 클래스에 `@RequiredArgsConstructor`를 사용합니다.

### 3.2. 컨트롤러 (`@Controller`, `@RestController`)

- **API 응답:** REST API의 경우, 항상 응답을 `Resp` DTO로 감싸고 `ResponseEntity`를 통해 반환합니다.
- **View 응답:** View 기반 컨트롤러의 경우, View 이름을 `String`으로 반환합니다.
- **Repository 직접 접근 금지:** 모든 데이터 접근은 Service 계층을 통해 이루어져야 합니다.

### 3.3. 서비스 (`@Service`)

- **목적:** 모든 비즈니스 로직을 포함합니다.
- **트랜잭션 관리:**
  - 클래스에 `@Transactional(readOnly = true)`을 선언합니다.
  - 데이터를 수정하는(생성, 수정, 삭제) public 메서드에는 `@Transactional`을 선언합니다.
- **데이터 흐름:**
  - **절대로** `Entity` 객체를 컨트롤러로 반환하지 않습니다.
  - **항상** 서비스 메서드에서 응답 DTO(`{Domain}Response$...`)를 생성하여 반환합니다.
  - 서비스 계층은 Entity를 DTO로 매핑하는 책임을 가집니다.

### 3.4. 엔티티 (`@Entity`)

- **연관관계 (`@ManyToOne`, `@OneToMany` 등):**
  - **규칙:** 모든 엔티티 연관관계는 **반드시** `FetchType.LAZY`를 사용해야 합니다.
  - 이 프로젝트는 `spring.jpa.open-in-view=false`로 설정되어 있습니다.
- **생성자:** 반드시 기본 `@NoArgsConstructor`가 있어야 합니다.
- **빌더:** 객체 생성을 위해 `@Builder`를 가져야 합니다.

### 3.5. DTO (Request/Response)

- **구조:** `{Domain}Request` 또는 `{Domain}Response` 래퍼 클래스 내부에 `public static` 내부 클래스로 정의합니다.
  - 예: `UserRequest.Login`, `BoardResponse.Detail`
- **어노테이션:** Getter, Setter 등을 생성하기 위해 `@Data`를 사용합니다.
