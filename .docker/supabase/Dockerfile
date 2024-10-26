# ベースイメージを指定する
FROM denoland/deno:debian-2.0.3

# パッケージマネージャを最新化
RUN apt update 
# 諸々のパッケージを追加する
RUN apt install -y curl git

# denon（denoでnpmっぽいことをするためのライブラリ）
RUN deno install --global --unstable -qAf https://deno.land/x/denon/denon.ts

# Supabase CLI
RUN curl -L https://github.com/supabase/cli/releases/download/v1.210.1/supabase_1.210.1_linux_arm64.deb -o supabase.deb \
    && apt install ./supabase.deb \
    && rm supabase.deb

# Denoのパスを通す
ENV PATH="/root/.deno/bin:$PATH"