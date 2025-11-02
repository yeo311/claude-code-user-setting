# Codex 스킬 가이드

## 작업 실행

1. `AskUserQuestion`을 통해 사용자에게 실행할 모델을 물어봅니다: `gpt-5` 또는 `gpt-5-codex`.
2. `AskUserQuestion`을 통해 사용자에게 사용할 추론 강도를 물어봅니다: `low`, `medium`, 또는 `high`.
3. 작업에 필요한 샌드박스 모드를 선택합니다; 편집이나 네트워크 접근이 필요하지 않은 경우 기본값은 `--sandbox read-only`입니다.
4. 적절한 옵션으로 명령어를 구성합니다:
   - `-m, --model <MODEL>`
   - `--config model_reasoning_effort="<low|medium|high>"`
   - `--sandbox <read-only|workspace-write|danger-full-access>`
   - `--full-auto`
   - `-C, --cd <DIR>`
   - `--skip-git-repo-check`
5. 이전 세션을 계속할 때는 stdin을 통해 `codex exec resume --last`를 사용합니다. **중요**: 재개할 때는 모델, 추론 강도 또는 다른 플래그를 지정할 수 없습니다—세션은 원래 실행의 모든 설정을 유지합니다. 재개 구문: `echo "여기에 프롬프트 입력" | codex exec resume --last`
6. 명령어를 실행하고, stdout/stderr를 캡처한 후, 사용자에게 결과를 요약해 줍니다.

### 빠른 참조

| 사용 사례                  | 샌드박스 모드           | 주요 플래그                                                      |
| -------------------------- | ----------------------- | --------------------------------------------------------------- |
| 읽기 전용 검토 또는 분석   | `read-only`             | `--sandbox read-only`                                           |
| 로컬 편집 적용             | `workspace-write`       | `--sandbox workspace-write --full-auto`                         |
| 네트워크 또는 광범위한 접근 허용 | `danger-full-access`    | `--sandbox danger-full-access --full-auto`                      |
| 최근 세션 재개             | 원래 설정에서 상속      | `echo "prompt" \| codex exec resume --last` (플래그 허용 안 됨)  |
| 다른 디렉토리에서 실행     | 작업 요구사항에 맞춤    | `-C <DIR>` 및 기타 플래그                                        |

## 후속 조치

- 모든 `codex` 명령어 실행 후, 즉시 `AskUserQuestion`을 사용하여 다음 단계를 확인하고, 명확한 설명을 수집하거나, `codex exec resume --last`로 재개할지 결정합니다.
- 재개할 때는 stdin을 통해 새 프롬프트를 전달합니다: `echo "새 프롬프트" | codex exec resume --last`. 재개된 세션은 자동으로 원래 세션의 동일한 모델, 추론 강도, 샌드박스 모드를 사용합니다.
- 후속 작업을 제안할 때 선택한 모델, 추론 강도, 샌드박스 모드를 다시 명시합니다.

## 오류 처리

- `codex --version` 또는 `codex exec` 명령어가 0이 아닌 종료 코드를 반환할 때마다 중지하고 실패를 보고합니다; 재시도하기 전에 지시를 요청합니다.
- 큰 영향을 미치는 플래그(`--full-auto`, `--sandbox danger-full-access`, `--skip-git-repo-check`)를 사용하기 전에 이미 허가를 받지 않은 경우 AskUserQuestion을 사용하여 사용자에게 허가를 요청합니다.
- 출력에 경고나 부분적인 결과가 포함된 경우, 요약하고 `AskUserQuestion`을 사용하여 조정 방법을 물어봅니다.
