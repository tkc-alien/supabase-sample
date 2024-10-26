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

#### URL・APIKey など確認

```sh
supabase status
```

## まなびメモ

### Supabase

#### ファイル名

- [参考](https://supersoftware.jp/tech/20240226/19414/)
- 公式の推奨では、スネーク・キャメル・ケバブが使い分けられてる
  - EdgeFunctions の関数名(URL に入る部分)はケバブケース
  - 他は特にこだわる感じではなさそう？個人的にはケバブ統一でいい気がする
- (推奨) 関数名でないディレクトリはアンダースコアを接頭辞にする
- (推奨) テストコードは`functions`直下に専用のディレクトリを作成し、ファイル名は接尾辞`test`をつける

### deno

#### CORS 対策

- [参考](https://supabase.com/docs/guides/functions/cors)
- レスポンスに`Access-Control-Allow-Origin`ヘッダを設定する
