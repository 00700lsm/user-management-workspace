# 개발자 최초 구성 및 Git 브랜치 사용법

## 최초 1회
```bash
git clone https://github.com/00700lsm/user-management-workspace.git
cd user-management-workspace
bash scripts/init.sh
```

Contract, Backend, Frontend 세 저장소가 `repos/`에 `dev`를 체크아웃한 상태로 설치됩니다. 각각 `origin/dev`를 추적합니다. Cursor 또는 VS Code에서 `user-management.code-workspace` 파일을 열어 작업하세요.

## 기존 설치 또는 명시적인 최신화
```bash
bash scripts/use-dev.sh
```

이 명령은 미커밋 변경이 없음을 확인한 뒤 세 저장소를 `dev`로 전환하여 `git pull --ff-only`합니다. **기존 Clone에서 자동 전환/자동 Pull은 하지 않습니다.** 작업 중에는 각 개발자가 필요한 저장소에서 수동 Fetch/Pull하세요.

## 기능 브랜치 / Commit / PR
```bash
cd repos/user-management-backend
git switch dev
git pull --ff-only
git switch -c feat/auth-login
# 개발 후 이 저장소에서만:
git status
git add auth/
git commit -m "feat(auth): implement login"
git push -u origin feat/auth-login
# PR: feat/auth-login → dev
```

Frontend도 **별도** `repos/user-management-frontend`에서 같은 절차를 수행합니다. 계약 변경 시에는 **Contract Repository에서 먼저** `contract/* → dev` PR을 제안·검토하고, 승인된 계약 SHA를 각 구현 저장소의 `contract.sha`에 반영합니다.

- `main`: 릴리스/안정 기준선
- `dev`: 팀 통합 작업 기준선
- `feat/*`, `fix/*`: 작업 브랜치 → `dev` PR
- `dev → main`: 검증 후 릴리스 PR

## Workspace Root Commit 금지 범위
- Workspace root에서 도메인 코드·요구사항·API·FE/BE 변경을 Commit하지 않습니다.
- Contract/Backend/Frontend **각자의 `.git`**에서 Commit/Push/PR을 수행합니다.
- 예외: `init.sh`, 에디터 설정, Workspace 개발 가이드 수정은 이 Workspace Repository에서 관리합니다.

## 계약·컴포넌트 검증
Frontend: `npm install && npm run contract:generate`.
Backend: `bash scripts/sync-contract.sh` (현재는 명세 다운로드; 서버 계약 테스트는 추후).
`contract.sha`는 승인된 Contract 커밋을 가리키며 자동으로 최신 값으로 바뀌지 않습니다.

## Claude Code

Workspace 루트에서 Claude Code를 실행해 `/workspace-init` 스킬을 호출할 수 있습니다. 기존 `scripts/init.sh`로 최초 Clone을 수행하고 각 저장소의 상태만 검사합니다. 자동 Pull은 하지 않습니다.

## Cursor / Codex / 기타 Agent

Workspace 루트에서 `.agents/skills/workspace-init/SKILL.md`를 사용합니다. 지원하는 도구에 `workspace-init` 스킬 실행을 명시적으로 요청하세요. 해당 스킬은 `scripts/init.sh`를 호출하고 세 저장소의 상태를 읽기 전용으로 점검합니다. 기존 저장소를 자동 Pull하거나 브랜치를 바꾸지 않습니다.
