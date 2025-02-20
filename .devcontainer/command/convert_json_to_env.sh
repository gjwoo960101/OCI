ENV_FILE=${PWD}/.devcontainer/.env
source $ENV_FILE

JSON_FILE="$containerWorkspaceFolder/config/mariadb.json"
ENV_FILE="$containerWorkspaceFolder/.devcontainer/.env"

# JSON 파일이 존재하는지 확인
if [ -f "$JSON_FILE" ]; then
  echo "🔄 JSON 파일을 .env로 변환하여 기존 내용에 추가 중..."

  # 구분선 추가
  echo -e "\n# Added from mariadb.json" >> "$ENV_FILE"

  # sed를 사용하여 JSON을 .env 형식으로 변환 후 기존 .env 파일에 추가
  sed -e 's/[{}]//g' \
      -e 's/"//g' \
      -e 's/\s*:\s*/=/g' \
      -e '/^\s*$/d' \
      -e 's/^[ \t]*//g' "$JSON_FILE" >> "$ENV_FILE"

  echo "✅ .env 파일이 업데이트되었습니다: $ENV_FILE"
else
  echo "⚠️ JSON 파일이 존재하지 않습니다: $JSON_FILE"
fi