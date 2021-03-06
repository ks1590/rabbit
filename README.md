# Rabbit

# 概要
専用のダッシュボード で日々の習慣を見える化、習慣管理のサポートを目的としたアプリ。
家計簿、学習、トレーニングの記録が可能。

# コンセプト
「日々の習慣管理を美しく。」をテーマに、使いやすさと見やすさを考慮したログ記録アプリ

# バージョン
* Ruby : 2.6.5<br>
* Rails : 5.2.5

# 機能一覧
* ユーザー
  * 新規登録
  * ログイン・ログアウト
  * プロフィール写真登録
  * 退会
* カレンダー
  * 家計簿、学習、トレーニングを記録
  * 保存済みレコードの編集、削除
  * 日付ごとに保存されたレコードを表示
* グラフ
  * レコードを項目別にグラフ表示
* テーブル
  * テーブル形式でレコード一覧を表示
* 電卓機能

# カタログ設計
* [カタログ設計.pdf](/docs/カタログ設計.pdf)

# テーブル定義 / ER図
* [テーブル定義.pdf](/docs/テーブル定義.pdf)<br>
* [ER図.png](/docs/ER図.png)

# 画面遷移図
* [画面遷移図.pdf](/docs/画面遷移図.pdf)

# ワイヤーフレーム
* [ワイヤーフレーム.pdf](/docs/ワイヤーフレーム.pdf)

# 就業Termから使用する技術
* Ajax
* devise
* AWS EC2/S3

# JSライブラリ（カリキュラム外から使用する技術）
* fullcalendar
* high_charts

# その他使用Gem
  * bootstrap　
  * kaminari
  * carrierwave
  * mini_magick
  * fog-aws
  * faker
  * autonumeric-rails
  * unicorn
  * capistrano