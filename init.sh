#!/bin/bash

# プロジェクト名（任意）
PROJECT_NAME=${1:-my-python-project}

# 必要なディレクトリとファイルを作成
mkdir -p src tests src/${PROJECT_NAME} src/${PROJECT_NAME}/services

mkdir .vscode

touch src/${PROJECT_NAME}/__init__.py
touch tests/__init__.py

# .gitignore を作成
cat <<EOF > .gitignore
.venv/
__pycache__/
*.pyc
*.pyo
*.pyd
.Python
.env
EOF

# settings.json を作成
cat <<EOF > .vscode/settings.json
{
    "python.testing.pytestArgs": [
        "tests"
    ],
    "python.analysis.extraPaths": [
        "./src"
    ],
    "python.testing.unittestEnabled": false,
    "python.testing.pytestEnabled": true
}
EOF


# launsh.jsonを 作成
cat <<EOF > .vscode/launch.json
{
    // IntelliSense を使用して利用可能な属性を学べます。
    // 既存の属性の説明をホバーして表示します。
    // 詳細情報は次を確認してください: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python デバッガー: 現在のファイル",
            "type": "debugpy",
            "request": "launch",
            "program": "\${file}",
            "console": "integratedTerminal"
        }
    ]
}