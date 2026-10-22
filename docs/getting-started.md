# 최초 개발 환경 설치

이 문서는 **Workspace 초기 구성만** 다룹니다. 기능 브랜치·PR·계약 변경·교차 리뷰 절차는 [Contract 개발 프로세스](https://github.com/00700lsm/user-management-contract#전체-개발-프로세스)를 따르세요.

## 최초 1회

```bash
git clone https://github.com/00700lsm/user-management-workspace.git
cd user-management-workspace
bash scripts/init.sh
```

이후 `user-management.code-workspace`를 VS Code/Cursor에서 엽니다. 세 하위 저장소는 각각 `repos/` 아래 독립 Git이며 `dev`를 추적합니다. 기존 Clone이 있다면 `init.sh`가 수정하지 않습니다.

## 기존 Clone을 명시적으로 dev로 전환·동기화

```bash
bash scripts/use-dev.sh
```

미커밋 변경이 없는지 검사한 후 **fast-forward Pull만** 수행합니다. 충돌하거나 작업 중인 저장소는 임의 Reset/Rebase/Merge하지 않습니다. 에디터·Agent 실행 시 자동 Git Pull도 하지 않습니다.

## AI 초기화

- Claude Code: Workspace 루트에서 `/workspace-init` 명시 호출
- Cursor/Codex 등: `.agents/skills/workspace-init/SKILL.md` 사용

두 방식 모두 `scripts/init.sh`와 동일한 안전 경계를 따릅니다.

## 설치 다음 단계

- [AA 요구·OpenAPI·개발 순서 및 다이어그램](https://github.com/00700lsm/user-management-contract#전체-개발-프로세스)
- [Backend 실행](https://github.com/00700lsm/user-management-backend#로컬-실행-및-확인)
- [Frontend 실행](https://github.com/00700lsm/user-management-frontend#로컬-실행-및-확인)

업무 변경은 반드시 해당 하위 저장소에 커밋·PR로 제출합니다.
