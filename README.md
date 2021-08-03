# Game Reviewers
<img width="1249" alt="スクリーンショット 2021-07-25 23 47 47" src="https://user-images.githubusercontent.com/58387537/126903330-edbe8c4f-3183-4c0d-aa5d-86c671f65aee.png">



# サービス概要
もともとゲームが好きで普段から時間が出来次第毎日やっております、しかし今は「ゲーム」といってもファミコンから勢いを出してきて現在は私たちにとって一般的になりつつあります。

「Game Reviewers」ではそんな数あるゲームを、レビュー、ブックマーク、ランキング、カレンダーなどの機能を使用して、日々のゲームライフをもっと楽しく豊かにしようと思いを込めたwebサービスです。

人々によって得られた感想などを可視化して、それらをユーザー間でやりとりすることで知らなかったあの名作まで「ゲーマーであることの誇り」を実現を目指します。



# 当webサービスを作成するにあたって気をつけたこと、これから実装したいこと

一つ一つの機能自体は至ってシンプル何か画期的なツールなどはありません、しかしRailsならではの強みである「MVCアーキテクチャ」の概念に忠実に従い何よりも「基本」や「開発者」であることを意識した構成を心がけました。
現在ではまだ実装できてない箇所もあり、日々取り組んで最後には自分の満足いく機能を実装したwebサービスを完成させます。
まだまだ未実装のところもあり現在も取り組んでるところや実装したい機能などを記述します。
そして、ただ単に「見せるため」に作成するのではなく、将来、実際に運用するようになったことを考えて、そのために必要な技術とは何かを考えてわからないながら必死に手を動かしています。

・管理者のみが管理できるアクセスできる管理画面. 

・ユーザー登録時のメールアクティベーション機能. 

・サイトマップやメタタグなどのSEO対策. 

・DoS（Denial of Services）攻撃などに備えたセキュリティー対策. 

・エラーなどの例外や不具合が発生したときの通知機能. 

・各種APIを使用したログイン機能など）. 

・CI/CDツールを使った自動テスト＆自動デプロイ. 

・リアルタイムチャット機能の実装

・Docker導入

等等です。


他にもGithub機能を利用して、実際にの開発の流れ「issue確認⇨ブランチを切る⇨開発を行う⇨プッシュする⇨プルリクエストを送信する⇨マージする」を意識してより実践一回流れで作業を進めました。

#開発環境. 

・Ruby 3.0.1. 

・Rails 6.0.4. 

・heroku. 

・AWS S3. 

・MySQL. 


# URL

https://game-reviewers.herokuapp.com/
```
テストユーザーアカウント
メールアドレス：test@example.com
パスワード：123456
```
＊ページ内では「クイックログイン機能（お試しユーザーとしてワンクリックでメールアクティベーションなしでログインできます）」も実装しております、そちらをご利用いただけると幸いです。


# ER図

<img width="718" alt="スクリーンショット 2021-07-27 17 16 34" src="https://user-images.githubusercontent.com/58387537/127120750-420a1e5b-8534-479c-b294-b5887901dcd5.png">



# 各種機能や導入技術(現段階)
・プラットフォーム(heroku, aws)

・データベース(Myaql)

・CSSフレームワーク(Boostrap4)

・ユーザー登録ログイン(devise)

・コードチェック(rubocop,bullet)

・ページネーション(Kaminari)

・画像アップロード(carrierwave, mini_magick,aws s3,fog)

・セキュリティーチェック(breakeman)

・レビュー(jquery.raty)

・カレンダー(simple_calender)

・いいね、ブックマーク(ajax)

・パーシャル(cell)

・パンくずリスト(greatel)

・評価機能（jquery.raty）.

・SEO対策(google-analytics,meta-tags)



# 現在の課題


・パスワード再設定メール送信後のURLからのアクセスできるページのCSS修正

・パスワード変更後のアラート位置がずれている

・マイページでのパスワード、メールアドレス変更機能の実装

・いいね！ボタンを押した際にページを更新しなくちゃボタンがそのまま

・パスワード再設定ページのcss修正

・レビュー投稿時にアップロードした画像が表示されない

