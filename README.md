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

## 개발 작업 시 참고할 문서와 스킬

Workspace의 유일한 프로젝트 스킬은 [`workspace-init`](.agents/skills/workspace-init/SKILL.md)입니다. **개발을 위한 별도의 Workspace 진입 스킬은 사용하지 않습니다.**

- 공통 설계 및 규칙: [Contract AA 문서](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/README.md) · [Agent Skill 작성 가이드](https://github.com/00700lsm/user-management-contract/blob/dev/docs/governance/agent-skills-guide.md)
- Frontend 개발: [Frontend 전용 Skill](https://github.com/00700lsm/user-management-frontend/blob/dev/.agents/skills/frontend-workflow/SKILL.md) · [디자인 기준](https://github.com/00700lsm/user-management-frontend/blob/dev/design.md)
- Backend 개발: [API 구현](https://github.com/00700lsm/user-management-backend/blob/dev/.agents/skills/implement-api-operation/SKILL.md) · [DB 마이그레이션](https://github.com/00700lsm/user-management-backend/blob/dev/.agents/skills/create-db-migration/SKILL.md) · [API 검증](https://github.com/00700lsm/user-management-backend/blob/dev/.agents/skills/validate-backend-api/SKILL.md) · [인증 통합 테스트](https://github.com/00700lsm/user-management-backend/blob/dev/.agents/skills/test-auth-integration/SKILL.md)

Agent는 작업 대상 Repository의 `AGENTS.md`/`CLAUDE.md` 및 Skill을 직접 참조합니다. API 정본은 Contract에 있으며, 실제 코드/설계 변경과 Commit은 해당 Repository에서만 처리합니다.

## 확정된 PoC 기술 스택

공통 아키텍처·H2 embedded DB 운영 기준은 [Contract 기술 스택 문서](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/tech-stack-proposal.md)에서 관리합니다. 각 Repository의 [Backend](https://github.com/00700lsm/user-management-backend/blob/dev/docs/aa/tech-stack.md) / [Frontend](https://github.com/00700lsm/user-management-frontend/blob/dev/docs/aa/tech-stack.md) 시작 안내를 참고하세요. **PoC 기술 기준은 Contract DEC-001~011에서 Accepted입니다. Workspace 루트는 여전히 초기 Clone/문서 진입만 담당하고 실제 앱/DB는 하위 저장소에서 관리합니다.**

실제 Skeleton 상태와 실행 순서는 [Backend 상태](https://github.com/00700lsm/user-management-backend/blob/dev/docs/implementation-status.md) 및 [Frontend 상태](https://github.com/00700lsm/user-management-frontend/blob/dev/docs/implementation-status.md)를 참고하세요. Backend/Frontend CI 기초 테스트는 통과했지만 실제 인증/업무 API 연동은 이후 구현 대상입니다.

## 전체 프로젝트 실행 (로컬 개발)

**사전 준비:** Git, Bash, Java 21, Node.js 24/npm, 인터넷 연결(Gradle·npm·승인된 OpenAPI 다운로드). Windows는 Git Bash/WSL 사용을 권장합니다. H2는 Backend에 내장되어 있어 별도 DB 서버 설치가 필요 없습니다.

처음 설치하는 경우 Workspace 루트에서 아래 명령으로 세 저장소를 준비합니다. 기존 저장소의 변경사항은 자동 Pull하지 않습니다.

```bash
bash scripts/init.sh
```

**터미널 1 — Backend (http://localhost:8080):**

```bash
cd repos/user-management-backend
mkdir -p .local-data
./gradlew test
./gradlew bootRun
```

**터미널 2 — Frontend (http://localhost:5173):** Workspace 루트에서 새 터미널을 엽니다.

```bash
cd repos/user-management-frontend
npm install
npm run contract:generate
npm run mocks:init
cp .env.example .env.local
# .env.local 파일에서 VITE_ENABLE_MOCKS=true 설정 (개발용)
npm run dev
```

- Mock 모드: `http://localhost:5173/login`에서 **Mock USER / Mock ADMIN**으로 화면·권한 라우트만 체험할 수 있습니다. 서명된 JWT가 아니며 실제 Backend 인증을 검증하지 않습니다.
- 실제 Backend 연동 모드: `.env.local`에서 `VITE_ENABLE_MOCKS=false`로 변경 후 Frontend를 재시작합니다. 현재 실제 로그인·가입·관리 API는 미구현이므로 정상 동작하지 않습니다.
- Backend 상태 확인: 별도 터미널에서 `curl http://localhost:8080/actuator/health`를 실행합니다.
- 테스트: Backend `./gradlew test`; Frontend `npm run typecheck && npm run test && npm run build`. Mock 브라우저 테스트는 Playwright Chromium 설치 후 `npm run test:e2e`.
- H2 로컬 데이터는 `repos/user-management-backend/.local-data/`에 생성되며 Git 추적에서 제외됩니다. Frontend의 `contract:generate`는 `contract.sha`에 고정된 OpenAPI를 사용합니다.
