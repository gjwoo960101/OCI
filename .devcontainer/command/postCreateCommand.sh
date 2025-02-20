ENV_FILE=${PWD}/.devcontainer/.env
source $ENV_FILE


# SSH 키 권한 설정
chmod 600 $containerWorkspaceFolder/ssh_keys/oci-main-instance.key

# JSON 변환 스크립트 실행 가능하게 변경 및 실행
chmod +x $containerWorkspaceFolder/.devcontainer/command/convert_json_to_env.sh
bash $containerWorkspaceFolder/.devcontainer/command/convert_json_to_env.sh
