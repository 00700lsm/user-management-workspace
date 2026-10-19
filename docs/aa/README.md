# AA 설계 문서 포털 (Workspace)

이 Workspace는 **세 Repository의 초기 Clone·탐색만 담당**하며 공통 요구/설계/API의 정본을 보유하지 않습니다. 아래 링크는 실제 작업 전에 읽어야 할 AA 문서의 위치를 안내합니다.

## 문서 소유권과 읽는 순서

| 분류 | 정본/작업 문서 | 위치 |
|---|---|---|
| 요구·기능 정의 | 요구 ID, 완료 조건, 업무 규칙 | [Contract 요구사항](https://github.com/00700lsm/user-management-contract/blob/dev/docs/requirements.md) · [상세 기능](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/functional-spec.md) |
| Architecture | Auth/User/Permission 경계, 데이터 소유 | [Contract 아키텍처](https://github.com/00700lsm/user-management-contract/blob/dev/docs/architecture.md) |
| DB 기준 | ERD, 주요 Entity/Key/Unique/상태 정책 | [Contract DB 논리 모델](https://github.com/00700lsm/user-management-contract/blob/dev/docs/db-design.md) |
| UI 기준 | 화면 IA, 화면 ID/route, 공통 UX | [Contract IA](https://github.com/00700lsm/user-management-contract/blob/dev/docs/ui-structure.md) · [공통 UI 원칙](https://github.com/00700lsm/user-management-contract/blob/dev/docs/ui-guidelines.md) |
| API Contract | Endpoint·Request·Response·권한 | [Contract OpenAPI](https://github.com/00700lsm/user-management-contract/blob/dev/openapi.yaml) |
| 추적/변경/결정 | REQ↔UI↔API↔DB↔TC, 보류사항, 계약 PR | [AA 추적표](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/traceability.md) · [결정 기록](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/decisions.md) |
| Backend 인계 | 서비스 책임, DB 소유, BE 착수/테스트 | [Backend AA 인계](https://github.com/00700lsm/user-management-backend/blob/dev/docs/aa/README.md) |
| Frontend 인계 | 화면별 행위/API, 사용자 흐름, 디자인 일관성 | [Frontend AA 인계](https://github.com/00700lsm/user-management-frontend/blob/dev/docs/aa/README.md) |

## 기술 스택 검토

- [공통 PoC 기술 스택 제안](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/tech-stack-proposal.md): Spring Boot + JPA/H2, React/Vite, Git/DB 통합 기준. **AA 미승인 제안**
- [Backend H2·JPA 환경 인계](https://github.com/00700lsm/user-management-backend/blob/dev/docs/aa/tech-stack.md)
- [Frontend Vite·React 초기 환경 인계](https://github.com/00700lsm/user-management-frontend/blob/dev/docs/aa/tech-stack.md)
- [AA 미결정 사항](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/decisions.md)에서 DEC-003/004/011 포함 승인 여부 확인

## 로컬에서 문서 탐색

```text
user-management-workspace/
└── repos/
    ├── user-management-contract/docs/aa/     # AA 공통 정본
    ├── user-management-backend/docs/aa/      # Backend 인계
    └── user-management-frontend/docs/aa/     # Frontend 인계
```

- 개발 착수: [착수 체크리스트](./developer-start-checklist.md)를 참고합니다.
- A=Auth FE+BE, B=User FE+BE, C=Permission FE+BE입니다.
- `dev`는 팀 통합 브랜치, `main`은 안정 기준선입니다.
- 구현 시 Frontend/Backend `contract.sha`에 지정된 **승인된 Contract 커밋**을 사용합니다. 위 `dev` 링크는 탐색용이며 SHA 고정 계약을 대체하지 않습니다.
- 이 문서를 Workspace에 작성했다고 실제 서비스 요구·DB·API 설계가 복제되는 것은 아닙니다. 설계 변경은 **Contract Repository**에만 제출합니다.
