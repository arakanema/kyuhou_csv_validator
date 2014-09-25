# kyuhou_csv_validator

給報CSVの検証ツール

## About
[eLTAX-各種ドキュメント-仕様書](http://www.eltax.jp/www/contents/1403107599834/index.html#dlCSV)に掲載してある、CSVレイアウト仕様書（給与支払報告書）に合致したデータであることを検証するためのツールです。

あくまで、CSVレイアウト仕様書に合致するかどうか？を検証するツールですので、取込み側システム個別の仕様については考慮されていません。

## License
[MITライセンス](http://ja.wikipedia.org/wiki/MIT_License)にて公開していますので、利用者の責任にて必要に応じ改変しご利用ください。  

This software is released under the MIT License, see LICENSE.

## Usage
利用方法は以下の通りです。

作業用フォルダを作成し、その中に kyuhou\_data\_validator.rb を入れます。同じフォルダにチェックしたいファイルをコピーして置きます。  
その状態で kyuhou\_data\_validator.rb を実行すると、ファイル名.error.log を生成しますので、メモ帳などで開いてエラー箇所を確認してください。

※チェック対象ファイルの拡張子は \*.csv, \*.txt, \*.dat を想定しています。

\*.error.log の内容は以下のようになります。

    エラーとなったデータの行数：エラーとなった項目番号：エラーとなったデータ

※Ruby2.0以上 が使える環境を前提としていますが、Rubyが使えない方のために、[ocra](http://rubygems.org/gems/ocra) にてexe化したファイルも合わせて置いておきます。


## etc
バグや機能改善などご提案があれば、Issue, PullRequest, [問い合わせフォーム](https://drive.google.com/open?id=1oSCqvtAe9WDst_mJGI5POfdLlk_33UVOimLE9WPYI0k&authuser=0) にて報告ください。

