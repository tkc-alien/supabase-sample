# supabase-sample

supabase の開発環境とかもろもろ試すプロジェクト

## コマンド集

### Supabase

#### 立ち上げ

```sh
supabase start
```

#### EdgeFunctions 起動（ホットリロード付き）

```sh
supabase functions serve
```

## まなびメモ

### CORS 対策

- [参考](https://supabase.com/docs/guides/functions/cors)
- レスポンスに`Access-Control-Allow-Origin`ヘッダを設定する
