# ベースイメージを指定する
FROM denoland/deno:debian-2.0.3

# パッケージマネージャを最新化
RUN apt update 

# 諸々のパッケージを追加する
RUN apt install -y curl git

# ORMを使用するためにnpmを追加する
RUN apt install -y nodejs npm \
    && npm install -g prisma@5.21.1

# denon（denoでnpmっぽいことをするためのライブラリ）
RUN deno install --global --unstable -qAf https://deno.land/x/denon/denon.ts

# Supabase CLI
RUN curl -o supabase.deb -L https://github.com/supabase/cli/releases/download/v1.210.1/supabase_1.210.1_linux_arm64.deb \
    && apt install ./supabase.deb \
    && rm supabase.deb

# Denoのパスを通す
ENV PATH="/root/.deno/bin:$PATH"