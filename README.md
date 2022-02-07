# englister

A new Flutter project.

## API自動生成

```
flutter pub run build_runner build
```

## アイコン更新

```
flutter pub run flutter_launcher_icons:main
```





# デプロイ手順
## iOS
Xcodeを起動し、GeneralからBuildとversionをインクリメントさせる。
Produce > Archive を選択します。
※ SimuratorがGeneric iOSDeviceになっていないと、グレーアウトしてArchiveが選択できません

Archiveが完了すると、 Distribute Appからアプリをアップロードできる。

アップロード完了のメールが届くのを待つ。

https://appstoreconnect.apple.com/ にアクセスし、申請を提出する

## Android
pubspec.yamlからバージョンコードをインクリメントさせる

```
flutter build appbundle
```

https://play.google.com/console/u/0/developers/5163613522237843658/app/4973201528415132726/tracks/production
にアクセスし、`build/app/outputs/bundle/release/app.aab`に出力されたファイルを