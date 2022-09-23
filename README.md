# englister

A new Flutter project.

## 初期設定

- ``.env.template``を``.env``にリネームする。

## API 自動生成

```
flutter pub run build_runner build
```

上記でエラーが出た場合は、競合しているファイルを一旦削除して再作成する下記のコマンドを試す。

```
flutter pub run build_runner build --delete-conflicting-outputs
```

## アイコン更新

```
flutter pub run flutter_launcher_icons:main
```

# デプロイ手順

## iOS

Xcode を起動し、General から Build と version をインクリメントさせる。
Produce > Archive を選択します。
※ Simurator が Generic iOSDevice になっていないと、グレーアウトして Archive が選択できません

Archive が完了すると、 Distribute App からアプリをアップロードできる。

アップロード完了のメールが届くのを待つ。

https://appstoreconnect.apple.com/ にアクセスし、申請を提出する

## Android

pubspec.yaml からバージョンコードをインクリメントさせる

```
flutter build appbundle
```

https://play.google.com/console/u/0/developers/5163613522237843658/app/4973201528415132726/tracks/production
にアクセスし、`build/app/outputs/bundle/release/app.aab`に出力されたファイルを
