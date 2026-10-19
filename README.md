# User Management Workspace

사용자 관리 프로젝트의 **초기 개발 환경 구성 전용 Repository**입니다.
공통 규칙·계약 및 기능 코드는 각각 독립된 하위 Repository가 소유합니다.

## 최초 설치

Git + Bash가 필요합니다 (Windows: Git Bash/WSL).

```bash
git clone https://github.com/00700lsm/user-management-workspace.git
cd user-management-workspace
bash scripts/init.sh
```

`init.sh`는 새로 Clone하는 Contract/Backend/Frontend를 **각각 `dev` 브랜치로 Checkout**하고 `origin/dev`를 추적하도록 구성합니다. 기존 Clone이 있으면 수정하거나 Pull하지 않습니다.

```text
user-management-workspace/        # Init 문서/스크립트만
├── scripts/init.sh
├── scripts/use-dev.sh
├── user-management.code-workspace
├── AGENTS.md
├── CLAUDE.md
└── repos/                        # .gitignore 대상 (개별 Git Repository)
    ├── user-management-contract/ # dev → origin/dev
    ├── user-management-backend/  # dev → origin/dev
    └── user-management-frontend/ # dev → origin/dev
```

Cursor/VS Code에서 `user-management.code-workspace`를 열어 네 폴더(Workspace Setup/Contract/Backend/Frontend)를 확인하세요. **에디터 실행 시 자동 Git Pull은 하지 않습니다.**

## Claude Code 초기화 스킬

Workspace Repository 루트에서 Claude Code를 시작한 뒤 **`/workspace-init`** 을 실행할 수 있습니다.

```bash
git clone https://github.com/00700lsm/user-management-workspace.git
cd user-management-workspace
claude
# Claude Code 세션에서 /workspace-init 실행
```

스킬 파일: [`.claude/skills/workspace-init/SKILL.md`](.claude/skills/workspace-init/SKILL.md)

스킬은 기존 `scripts/init.sh`를 사용해 누락된 Repository를 `dev`로 Clone하고 각 Repository의 브랜치·upstream·Contract SHA 상태를 **읽기 전용으로 확인**합니다. **기존 Clone Pull/브랜치 변경/Commit은 자동 수행하지 않습니다.** Claude Code 내장 `/init`과 구분되는 이름입니다.

## 기존 Clone의 dev 브랜치 설정/명시적 Pull

```bash
bash scripts/use-dev.sh
```

위 명령은 세 저장소의 작업 트리가 모두 깨끗한지 확인한 뒤 `dev` 브랜치로 전환하여 **fast-forward Pull만** 실행합니다. 충돌하거나 로컬 작업이 있으면 자동 Merge/Reset/Rebase하지 않습니다.

## Git 커밋 규칙 (중요)

**업무 코드 및 업무 설계 변경을 Workspace 루트에 커밋하지 않습니다.**

- Contract/OpenAPI/공통 개발 규칙 → `repos/user-management-contract`
- Backend 기능/테스트 → `repos/user-management-backend`
- Frontend 기능/UI/테스트 → `repos/user-management-frontend`
- Workspace 루트의 Git은 **Init 스크립트, Workspace 설정, 개발 환경 안내의 변경에만 예외적으로 사용**합니다.
- 기능 개발은 각 Repository의 `dev`에서 기능 브랜치를 만들어 개별 Commit/Push/PR을 진행합니다.

공통 규칙 정본: [Git 협업 운영 규칙](https://github.com/00700lsm/user-management-contract/blob/dev/docs/governance/git-workflow.md)

## 담당

| 개발자 | Backend | Frontend |
|---|---|---|
| A | Auth | 로그인·로그아웃·비밀번호 |
| B | User | 회원가입·프로필·사용자 관리 |
| C | Permission | Role·사용자 권한 관리 |

같은 담당자가 같은 도메인의 FE+BE를 개발합니다.

상세 절차: [개발 시작 안내](docs/getting-started.md).

## Cursor / Codex / 기타 AI Agent 스킬

공통 초기화 스킬 정본은 [`.agents/skills/workspace-init/SKILL.md`](.agents/skills/workspace-init/SKILL.md)입니다. Cursor와 Codex처럼 프로젝트 로컬 Agent Skills를 지원하는 도구에서 명시적으로 `workspace-init` 스킬을 요청하세요. Claude Code의 `/workspace-init`도 이 스킬을 참조합니다. 모두 같은 `scripts/init.sh`를 사용하며, 기존 Clone은 Pull/전환하지 않습니다.

## AA 문서 안내

[AA 설계 문서 포털](docs/aa/README.md)에서 Contract/Backend/Frontend 인계서를 한 번에 찾아볼 수 있습니다. 개발 전 [착수 체크리스트](docs/aa/developer-start-checklist.md)를 확인하세요. **Workspace 루트에는 업무 기능이나 AA 설계의 정본을 저장·커밋하지 않습니다.**

## 개발 단계별 Agent 스킬

- [Contract 공통 참조](.agents/skills/contract-reference/SKILL.md)
- [Frontend 설정→개발→Mock→통합](.agents/skills/frontend-workflow/SKILL.md)
- [Backend 설정→개발→계약 테스트→통합](.agents/skills/backend-workflow/SKILL.md)
- [스킬 작성 및 공통 준수 가이드](https://github.com/00700lsm/user-management-contract/blob/dev/docs/governance/agent-skills-guide.md)

Workspace의 스킬은 하위 저장소 스킬로 연결합니다. Claude Code에서는 같은 이름의 프로젝트 스킬을 사용하며, 코드 커밋은 각 구현 저장소에서만 합니다.

## 프로젝트 기술 스택 제안

공통 아키텍처·H2 embedded DB 운영 제안은 [Contract 기술 스택 문서](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/tech-stack-proposal.md)에서 관리합니다. 각 Repository의 [Backend](https://github.com/00700lsm/user-management-backend/blob/dev/docs/aa/tech-stack.md) / [Frontend](https://github.com/00700lsm/user-management-frontend/blob/dev/docs/aa/tech-stack.md) 시작 안내를 참고하세요. **기술 선택은 아직 AA 승인 전이며 Workspace 루트에 앱이나 DB 파일을 저장하지 않습니다.**
