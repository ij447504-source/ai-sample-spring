<!-- Parent: ../../AI-CONTEXT.md -->

# resources

## 목적

애플리케이션의 설정, 정적 파일, 템플릿 등 비-Java 리소스를 관리합니다.

## 주요 파일

| 파일명 | 설명 |
| --- | --- |
| `application.properties` | Spring Boot 애플리케이션의 주요 설정 파일입니다. (데이터베이스, 서버 포트 등) |

## 하위 디렉토리

- `db/` - 데이터베이스 초기화에 사용되는 SQL 스크립트 (`data.sql`)를 포함합니다.
- `static/` - CSS, JavaScript, 이미지 등 정적 파일을 위치시키는 곳입니다.
- `templates/` - 서버 사이드 렌더링에 사용되는 Mustache 템플릿 파일을 포함합니다.

## AI 작업 지침

- 데이터베이스 스키마나 초기 데이터 변경 시 `db/data.sql`을 수정합니다.
- UI 템플릿 관련 작업은 `templates/` 디렉토리에서 수행합니다.
- 정적 에셋(이미지, CSS)은 `static/`에 추가합니다.

## 테스트

- 리소스 파일 자체에 대한 자동화된 테스트는 일반적으로 설정하지 않으나, 이 리소스를 사용하는 기능(예: Controller가 템플릿을 렌더링하는지)에 대한 통합 테스트로 검증합니다.

## 의존성

- 내부: 없음
- 외부: `Spring Boot`, `H2 Database`, `Mustache`
