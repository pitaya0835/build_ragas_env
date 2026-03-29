# 軽量なPython公式イメージをベースにする
FROM python:3.10-slim

# 作業ディレクトリの設定
WORKDIR /app

# 必要なパッケージ（ビルドツールなど）をインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# requirements.txtをコンテナにコピー
COPY requirements.txt .

# ライブラリのインストール（ここでインターネット接続が必要です）
RUN pip install --no-cache-dir -r requirements.txt

# ローカルのソースコードをコンテナにコピー（実行スクリプトなどがある場合）
COPY . .

# デフォルトのコマンド（必要に応じて変更）
CMD ["/bin/bash"]
