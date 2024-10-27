#!/bin/bash

# 型ファイルを一時ディレクトリに生成する
# （openapi2aspidaを使用 https://github.com/aspida/openapi2aspida）
deno run -RWE npm:openapi2aspida -i /work/.swagger/schema.yml -o /tmp/gen:schema

# 必要なファイルのみ移動する
cp -r /tmp/gen:schema/@types/index.ts /work/supabase/functions/_shared/schema.d.ts

# 一時ディレクトリを削除する
rm -rf /tmp/gen:schema
