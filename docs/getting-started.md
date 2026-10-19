# 개발자 초기 설정 및 작업 안내

## 최초 실행
```bash
git clone https://github.com/00700lsm/user-management-workspace.git
cd user-management-workspace
bash scripts/init.sh
```

그다음 Cursor 또는 VS Code에서 `user-management.code-workspace`를 엽니다. `repos/` 아래 세 작업 폴더가 Workspace에 등록됩니다.

### 사전 확인
- macOS/Linux: Git과 Bash 필요
- Windows: Git Bash 또는 WSL 사용
- GitHub 접근 권한 필요 (현재 저장소는 공개 상태)
- 팀원별로 Git 작성자 정보 및 GitHub 인증 설정 필요

## 기능 개발 시
1. Contract Repo의 요구사항·화면/DB 초안·협업 규칙·`openapi.yaml`을 확인합니다.
2. FE/BE 저장소에서 각각 해당 도메인의 기능 브랜치를 만듭니다.
3. 각 저장소의 `contract.sha`가 동일한 승인된 계약 커밋을 가리키는지 확인합니다.
4. Frontend: `npm install && npm run contract:generate` (프로젝트 구성 단계에 따라 필요).
5. Backend: `bash scripts/sync-contract.sh` (현재는 명세 다운로드/검증 기반이며 실제 서버 테스트는 후속 구현).
6. FE와 BE 변경은 **각 저장소에서 개별 커밋 및 PR**을 제출합니다.
7. API 규격이 바뀌면 구현보다 Contract PR을 먼저 처리합니다.

## 실행 범위
`scripts/init.sh`는 **Clone만 담당**합니다. 반복 실행 시 정상 Clone 폴더는 건드리지 않고 넘어갑니다. 자동 Pull, 브랜치 변경, Git 설정 변경, npm install, 코드 수정, AI Agent 실행은 하지 않습니다.

주의: 공통 Contract의 문서 변경이 있었다고 각 구현 저장소의 `contract.sha`가 자동으로 변경되는 것은 아닙니다. 계약 버전 조정은 명시적으로 진행합니다.
