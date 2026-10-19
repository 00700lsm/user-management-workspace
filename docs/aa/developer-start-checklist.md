# AA 설계 인수 및 개발 착수 체크리스트

**진행 상태: 미체크.** 팀원은 자기 담당 영역에서 확인 후 PR/이슈에 증빙을 남깁니다.

## Workspace / Git
- [ ] `bash scripts/init.sh`로 Contract/Backend/Frontend 3개 저장소 받음
- [ ] 세 저장소가 독립 Git임을 확인. Workspace 루트에서는 기능 코드를 커밋하지 않음
- [ ] 각 Repository `dev` 기준 브랜치 및 PR 전략 확인
- [ ] 기존 복제본 Pull은 명시적으로 필요한 경우에만 `bash scripts/use-dev.sh` 사용

## AA 공통 설계 인수
- [ ] [공통 AA 패키지](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/README.md) 읽음
- [ ] 요구사항 ID, 기능 상세/완료 기준, 사용자 역할 정책 확인
- [ ] 서비스 기능/DB 데이터 Owner 및 연결 지점 확인
- [ ] 화면 IA/화면 ID/공통 UX 기준 확인
- [ ] OpenAPI 외부 FE↔BE 계약 확인
- [ ] [미결정 사항](https://github.com/00700lsm/user-management-contract/blob/dev/docs/aa/decisions.md) 중 착수 차단 항목을 AA와 합의함
- [ ] Frontend/Backend `contract.sha`가 같은 승인 Contract SHA임을 확인

## 담당 도메인 인계
- [ ] 개발자 A: Auth FE + Auth BE 관련 [BE 인계](https://github.com/00700lsm/user-management-backend/blob/dev/docs/aa/README.md) / [FE 인계](https://github.com/00700lsm/user-management-frontend/blob/dev/docs/aa/README.md) 확인
- [ ] 개발자 B: User FE + User BE 경계, 가입 정합성, 사용자 목록·CRUD/상태 확인
- [ ] 개발자 C: Permission FE + Permission BE 경계, Role 조회·배정/관리자 권한 확인

## 개발 결과 검증
- [ ] FE/BE 별도 Repository에 Commit/PR 작성 (`feat/* → dev`)
- [ ] PR에 관련 REQ/UI/TC ID, 계약 SHA, 변경 영향 및 테스트 근거 기재
- [ ] 계약 변경 필요 시 Contract PR 선승인 후 구현 반영
- [ ] 화면 공통 컴포넌트·오류/권한·모듈 간 연결 확인
- [ ] 최종 통합 E2E 수행 근거 링크 연결

이 파일은 개발 준비 상태를 확인하는 **인계 체크리스트**로, 구현 완료를 자동 판정하지 않습니다.
