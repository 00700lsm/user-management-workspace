## Workspace 초기화/가이드 변경 내용

- 관련 Issue:
- 변경 이유 및 영향:
- Contract/Backend/Frontend 기능·API 파일을 Workspace에 직접 추가하지 않았는가?

## 리뷰와 검증

- [ ] 작성자가 아닌 Write 권한 리뷰어 1명 요청
- [ ] init.sh/use-dev.sh 안전성, 원치 않는 자동 Pull·Reset·Merge 없음
- [ ] `repos/` 하위 저장소는 Workspace Git에서 추적하지 않음
- [ ] `workspace-init` 외에 중복 Skill 추가 없음
- [ ] CI `workspace-checks` PASS

- CI 링크:
- 검증하지 못한 사항:
