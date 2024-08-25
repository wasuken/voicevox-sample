# tolist

## 1. VVを立ち上げる

```bash
$ docker compose up -d
```

## 2. 音声ファイルを作る

```bash
$ sh run.sh
```

voice.wavを作成

## 3. Walkmanで再生する

アカウント共有もくそもないので、ngrokで共有

1. install ngrok
2. run ngrok
3. 事前にhttp-serverでwavファイルを提供できるように
3. URLをqrcode化してwalkmanで読み込む

## 4. 一連の処理を自動化する

バックエンド: 内部ネットワーク経由でVoiceVoxサーバとやり取りする
フロントエンド: バックエンドに指示を渡す

### バックエンド

1. backend -> VoiceVox: 音声ファイル作成(音声ファイルパラメタ) => 音声ファイルデータ
2. frontend -> backend: 音声ファイル参照(音声ファイルID) => パス
3. f -> b: 音声ファイルの一覧() => 音声ファイルリスト
4. f -> b: 音声ファイルを作成要求(音声ファイルパラメタ) => t/f

