# Workspace 저장소 보호 정책 P0-03

대상: `main`, `dev`. PR 필수, 작성자 외 Write 권한 1명 승인, 신규 커밋 때 승인 갱신, 리뷰 대화 해결, 직접 Push/Force Push/브랜치 삭제 제한.

필수 GitHub Actions job: `workspace-checks` (`.github/workflows/workspace-checks.yml`). 이 Workflow는 Bash 구문·설치 스크립트/Skill 구조 및 `repos/` Git 추적 금지를 확인합니다. **실제 Git 원격 Clone 테스트는 실행하지 않습니다.**

이 준비 변경의 PR을 `dev`에 병합하고 `main`에 반영한 **뒤에** GitHub Admin이 Ruleset을 켜야 합니다. Contract 저장소의 `docs/governance/branch-protection-rollout.md`와 Workspace 대응 JSON을 참고합니다. Write 권한 리뷰어가 없으면 1인 승인 조건을 활성화하지 마세요.

관리자 Ruleset: `main-dev-pr-review-and-ci`, Active, `refs/heads/main` 및 `refs/heads/dev`; pull_request 승인 1명, stale review dismissal/last push approval, review thread resolution, deletion/force push 금지; status context `workspace-checks`. Restrict updates는 사용하지 않습니다.
