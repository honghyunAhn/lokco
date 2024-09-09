# ラッコ
移動人口の多い駅や観光地などの地域に設置されたコインロッカーの位置を表示し、最寄りやユーザーが検索した地域にあるコインロッカーの位置を知らせるウェブサイト

![logo](https://user-images.githubusercontent.com/54131117/95624534-fcb2d680-0ab1-11eb-96af-6c466aa5c70b.png)

- Languages              : Java SE 8
- Frameworks & Tools     : Spring 4.5、KakaoMapAPI、 
                           ImportAPI
- Web Servers            : Apache Tomcat v9.0
- Database               : Oracle SQL Developer 19.4
- Web Developement       : HTML、JavaScript、CSS、Ajax
- Operating Systems      : Windows 10
- Creative Design Skills : Adobe Photoshop 19.1

- Development period: 2020.3.10 ~ 2020.4.24
<br>

# ラッコの強み
![click](https://user-images.githubusercontent.com/54131117/95625528-94fd8b00-0ab3-11eb-9420-304684147b6e.png)

- **便利さ**
 : 様々な実用的機能を簡単に使用可能
 

![main](https://user-images.githubusercontent.com/54131117/95625635-bd858500-0ab3-11eb-8f2c-365c9e58eed6.png)

- **簡潔**
 : 直観的で分かりやすいデザイン
 

![benry](https://user-images.githubusercontent.com/54131117/95625637-bf4f4880-0ab3-11eb-875b-8fffc998aa41.png)

- **はん用性**
 : 様々なアイテムに適用可能

<br>
<br>

## 担当分野

- **担当分野 : メイン画面のHTML、CSSを作りました。**
- 直観的で旅行者が使う時、ロードが速くデータを少なくするため、テンプレートを使わずに直接メイン画面を作りました。

  ![main2](https://user-images.githubusercontent.com/54131117/95626132-a5623580-0ab4-11eb-9d92-e0f5755192e0.png)

***
- **担当分野 : KakaoAPIを利用して地図を具現**

![1](https://user-images.githubusercontent.com/54131117/95626319-0558dc00-0ab5-11eb-9f3e-a3f565c44a4d.png)

１. 全体画面 : 画面全体に出るようにしました。サイズを%に指定して、どのプラットフォームでも全画面に出力されます。

２. カテゴリ : 周辺のサービス施設を項目によって表示します。特に、ホテルをクリックすると、ホテルの予約サイトでホテルの名前で検索して新しいウィンドウ   を表示します。
  - ウェブアドレスに検索された項目の名前を一緒に入力して、ホテル予約サイトで検索します。 
  ![7](https://user-images.githubusercontent.com/54131117/95626452-3fc27900-0ab5-11eb-9dfb-afd06ca1cc32.png)

***
- **担当分野 : KakaoAPIを利用して地図を具現**

![2](https://user-images.githubusercontent.com/54131117/95626323-068a0900-0ab5-11eb-931f-a99ab020c59c.png)

１. 現在地 : 現在地をクリックすると、現在の位置に移動します。

２. 場所 : 場所を検索してロッカーの位置、数を知ることができます。

３. 拡大·縮小 : 地図を拡大、縮小することができます。

***
- **担当分野 : KakaoAPIを利用して地図を具現**

![3](https://user-images.githubusercontent.com/54131117/95626325-07229f80-0ab5-11eb-80a4-02eba5b84867.png)

１. 詳細情報 : ロッカー名をクリックすると、modalで詳細情報を出力されます。

２. 経路検索 : 経路検索をクリックして、カカオマップにロッカー名とGPSを伝えると、経路検索を行います。

３. 予約 : 予約をクリックすると、ロッカー名を予約画面へ渡します。

![6](https://user-images.githubusercontent.com/54131117/95626916-2f5ece00-0ab6-11eb-9a91-0450b31b1a97.png)

４. ロッカー表示 : DBのGPSはvarcharとして保存されています。 ですから、splitを使って緯度と経度を分けて数字で強制変換します。

***
- **担当分野 : 個人プロジェクトで作ったロッカー予約システムを直して適用しました。**

![4](https://user-images.githubusercontent.com/54131117/95626326-07229f80-0ab5-11eb-8621-6e19f6501fdd.png)





