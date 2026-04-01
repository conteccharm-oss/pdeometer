CONTEC 챌린지 - 사용 가이드

[ 암호 변경 방법 ]
index.html 파일을 메모장으로 열고 아래 부분 수정:

  const CONFIG = {
    password: 'contec2024',   ← 암호 변경
    adminName: '이슬',         ← 관리자 이름 변경
  };

[ Supabase Storage 버킷 ]
Supabase → Storage → New bucket
이름: challenge-images / Public: ON

[ 매월 자동 리셋 ]
별도 작업 불필요. year_month 값으로 자동 분리됨.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
