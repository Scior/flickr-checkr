# flickr-checkr
## なにこれ
Flickrで大量フォローした後に、すぐフォローを外してフォロワー稼ぎをする人を検出する目的で作られたのツールです。  
自分がフォローしているユーザーのうち、相手からフォローされていない場合にユーザー名を表示します。
## 使い方

Flickrからキーを取得(<https://www.flickr.com/services/apps/create/apply>)してきて、ソースコードと同じディレクトリに"key"という名前のファイルを置いてください。
中身は、
```
(consumer key)
(consumer secret)
```
のように1行ずつ分けて記述してください。

次に、
```
bundle install
```
を実行したのち、
```
bundle exec ruby authorize.rb
```
でアクセストークンを取得します。
表示されるURLにアクセスして、PINコードを取得し、入力してください。  

最後に、
```
bundle exec ruby checkr.rb
```
を実行すれば、コンソール上にユーザー名が表示されます。
