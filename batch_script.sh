#!/bin/bash

#!/bin/bash

# ロックファイルのパス
LOCKFILE="/tmp/batch_script.lock"

# 既にロックファイルが存在するか確認
if [ -e "${LOCKFILE}" ] && kill -0 `cat ${LOCKFILE}` 2>/dev/null; then
    echo "Batch job is already running"
    exit 1
fi

# ロックファイル作成（プロセスIDを記録）
trap "rm -f ${LOCKFILE}; exit" INT TERM EXIT
echo $$ > "${LOCKFILE}"

# バッチ処理の内容をここに記述
curl -XPOST "http://node:5000/api/voice/path"

# 処理終了後にロックファイルを削除
rm -f "${LOCKFILE}"
