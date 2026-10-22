# User Management Workspace

**이 저장소는 최초 개발 환경 세팅 전용**입니다. 요구사항, 아키텍처, DB·API 계약, 도메인 코드, 통합 검증 규칙은 여기서 관리하지 않습니다.

## 1. 최초 설치

Git 및 Bash가 필요합니다. Windows는 Git Bash 또는 WSL을 사용하세요.

```bash
git clone https://github.com/00700lsm/user-management-workspace.git
cd user-management-workspace
bash scripts/init.sh
```

`init.sh`는 없는 저장소만 `repos/` 아래에 Clone하고 각각 `dev`를 추적하도록 설정합니다. **기존 Clone의 코드·브랜치·미커밋 변경은 건드리지 않습니다.**

```text
user-management-workspace/
├── scripts/init.sh                  # 최초 Clone
├── scripts/use-dev.sh               # 사용자가 명시할 때만 FF 동기화
├── user-management.code-workspace   # VS Code / Cursor
└── repos/                           # .gitignore, 각자 독립 Git
    ├── user-management-contract/
    ├── user-management-backend/
    └── user-management-frontend/
```

`user-management.code-workspace`를 열면 네 폴더를 함께 탐색할 수 있습니다. 에디터 실행만으로 자동 Pull하지 않습니다.

기존 설치를 명시적으로 최신화하려면, 세 저장소 작업 트리가 깨끗한 상태에서:

```bash
bash scripts/use-dev.sh
```

이 스크립트는 `dev`로 전환 후 fast-forward Pull만 수행하며 Merge/Reset/Force Push하지 않습니다. 자세한 초기 사용법은 [getting-started](docs/getting-started.md)를 참고하세요.

## 2. 여기서 끝, 실제 개발은 소유 저장소에서

| 저장소 | 담당 범위 | 필수 문서 |
|---|---|---|
| [Contract](https://github.com/00700lsm/user-management-contract) | AA 요구·DB 논리 모델·화면 IA·OpenAPI·공통 협업 규칙 | [전체 개발 프로세스와 흐름도](https://github.com/00700lsm/user-management-contract#전체-개발-프로세스) · [AA 인계](https://github.com/00700lsm/user-management-contract/tree/dev/docs/aa) |
| [Backend](https://github.com/00700lsm/user-management-backend) | A=Auth, B=User, C=Permission Backend | [실행·테스트·Agent Skills](https://github.com/00700lsm/user-management-backend#readme) |
| [Frontend](https://github.com/00700lsm/user-management-frontend) | 같은 A/B/C의 Frontend, 공통 UI | [실행·테스트·디자인 규칙](https://github.com/00700lsm/user-management-frontend#readme) |

**Workspace 루트에는 업무 코드·AA 설계·API 변경을 커밋하지 않습니다.** 각자의 `repos/<repository>`에서 기능 브랜치와 PR을 관리하고, 승인된 `contract.sha`를 사용합니다. A/B/C 담당자는 각자 FE+BE를 함께 개발합니다.

## 3. AI 도구의 초기화 지원

- Claude Code: Workspace 루트에서 `/workspace-init`
- Cursor/Codex/호환 Agent: `.agents/skills/workspace-init/SKILL.md`
- 두 방식 모두 `scripts/init.sh`를 재사용하며, 사용자가 요청했을 때만 초기화합니다.

Workspace의 **유일한 스킬은 `workspace-init`**입니다. 기능 구현과 검증 스킬은 Backend/Frontend/Contract에 있습니다.

공통 Git/PR 운영 정책과 P0-03 Ruleset 절차는 [Contract 형상관리 정본](https://github.com/00700lsm/user-management-contract/blob/dev/docs/governance/git-workflow.md)에서 관리합니다.
