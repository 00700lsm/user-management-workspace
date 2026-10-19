# User Management Workspace

사용자 관리 PoC를 위한 **최초 1회 개발 환경 구성 저장소**입니다. 이 저장소 자체에는 Frontend/Backend 소스와 OpenAPI 정본을 넣지 않습니다.

## 1. 최초 설치

Git과 Bash가 필요합니다. macOS/Linux에서 실행할 수 있으며 Windows는 Git Bash 또는 WSL을 사용하세요.

```bash
git clone https://github.com/00700lsm/user-management-workspace.git
cd user-management-workspace
bash scripts/init.sh
```

`init.sh`는 `repos/` 폴더에 Contract, Backend, Frontend 저장소를 Clone합니다. 이미 올바른 저장소가 있으면 **건너뛰고 변경하지 않습니다.** Git Pull, Fetch, 브랜치 생성, Commit 및 의존성 설치를 자동 수행하지 않습니다.

## 2. 개발환경 열기

Cursor 또는 VS Code에서 `user-management.code-workspace` 파일을 엽니다.

```text
user-management-workspace/      # 별도 Git 저장소: 초기화 도구/안내
├── scripts/init.sh
├── user-management.code-workspace
├── AGENTS.md
├── CLAUDE.md
└── repos/                      # Git 추적 제외; init이 생성
    ├── user-management-contract/
    ├── user-management-backend/
    └── user-management-frontend/
```

## 3. 개발 규칙과 문서 정본

- [공통 API 계약](https://github.com/00700lsm/user-management-contract/blob/main/openapi.yaml)
- [AA 설계 및 화면·DB 기준](https://github.com/00700lsm/user-management-contract/tree/main/docs)
- [Git·PR 협업 규칙](https://github.com/00700lsm/user-management-contract/blob/main/docs/governance/git-workflow.md)
- [API 계약 변경/승인 절차](https://github.com/00700lsm/user-management-contract/blob/main/docs/contract-governance.md)

공통 개발 기준은 **Contract 저장소에만 유지**합니다. Workspace는 그 링크를 안내하며 규칙을 별도 복제하지 않습니다.

### 담당 영역

| 개발자 | Backend | Frontend |
|---|---|---|
| A | Auth | 로그인·로그아웃·비밀번호 |
| B | User | 회원가입·프로필·사용자 CRUD |
| C | Permission | Role·사용자 권한 관리 |

동일 개발자가 **같은 업무 영역의 FE + BE**를 담당합니다.

## 4. 개발 작업

각 Repository는 독립 Git 저장소입니다. 현재 작업 폴더에서 해당 Repository로 이동해 `git fetch`, `git pull`, 브랜치 생성, Commit, PR을 **필요할 때 개별 수행**하세요. 하나의 Workspace로 열었다고 세 Repository의 커밋이 합쳐지지는 않습니다.

Frontend/Backend는 각각의 `contract.sha`에 고정된 공통 OpenAPI 버전을 사용합니다. 계약 변경은 **Contract Repo PR 승인 및 Merge를 먼저** 진행합니다.

더 자세한 작업 순서는 [개발 시작 안내](docs/getting-started.md)를 참고하세요.

> 이 저장소는 Clone 및 에디터 워크스페이스 구성만 자동화합니다. Git 동기화·코드 생성·테스트·Agent 실행은 개발자가 명시적으로 수행합니다.
