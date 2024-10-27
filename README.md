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

#### DB GUI で作成したスキーマをマイグレーションとして保存

```sh
supabase db diff --file {filename}
```

### Deno

#### スキーマから型ファイル作成

```sh
bash ./.script/gen:schema.sh
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

#### DB マイグレーション

- [参考](https://zenn.dev/razokulover/articles/db984ebfcf4bf6)
- おそらく GUI ベースでスキーマ構築するのがベストな感じ？もろもろ最適化してくれてそう
- GUI で作成したスキーマを`supabase db diff`コマンドで SQL に起こしてバージョン管理に含めるのが良さげ？
- 個人的には自前でコードベースで管理したい。なんか上手くできないかな…。
  - `supabase/migrations`以下に SQL ファイルを置いて、`supabase migration up`を実行すれば一応 SQL で管理できた。
  - ただし GUI で作成したものが既にある場合、up コマンドが正常に動作しない（デフォで`IF NOT EXISTS`がついてないので SQL のエラーになる）
  - せっかくタイムスタンプ付けてるんだから最終適用日時を持っておいて適用範囲決めるくらいやってほしい…

### deno

#### CORS 対策

- [参考](https://supabase.com/docs/guides/functions/cors)
- レスポンスに`Access-Control-Allow-Origin`ヘッダを設定する

#### OpenAPI

- 探したけど Supabase 用のジェネレータは提供されてなさそう
- components の型生成だけできる軽量パッケージを一旦使ってみる
