const pay = () => {

  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);// PAY.JPテスト公開鍵。注意）公開鍵を残したままGitHubにプッシュしてはいけない
  const form = document.getElementById("charge-form");//charge-form内のsubmitが実行されるとイベントが発火
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");//入力ホーム全体のデータがここに入っている「form_with ~ end」
    const formData = new FormData(formResult);//全部撮ってきてそれをformデータとして認識される

    //クレカ情報を変数に代入している
    const card = {
      number: formData.get("oder_buy[number]"),//クレカのナンバー
      cvc: formData.get("oder_buy[cvc]"),//クレカのCVC
      exp_month: formData.get("oder_buy[ex_month]"),//クレカの期限「月」
      exp_year: `20${formData.get("oder_buy[ex_year]")}`//クレカの期限「年」
    };
    
    Payjp.createToken(card, (status, response) => {

      if (status == 200) { //PAY.JP側の処理でトークンの生成に成功した場合に、if文の中のコードが実行

        const token = response.id;//生成されたトークンを変数に代入
        const renderDom = document.getElementById("charge-form");//生成する要素を取得
        const tokenObj = `<input value=${token} type="hidden" name='oder_buy[token]'>`;//生成するHTMLを定義
        renderDom.insertAdjacentHTML("beforeend", tokenObj);//formの最後に生成
      }

      //入力された各カード情報がパラメーターとして送られないように、値を削除
      document.getElementById("card-number").removeAttribute("name");//クレカのナンバー情報削除
      document.getElementById("card-cvc").removeAttribute("name");//クレカのcvc情報削除
      document.getElementById("card-exp-month").removeAttribute("name");//クレカの「月」情報削除
      document.getElementById("card-exp-year").removeAttribute("name");//クレカの「年」情報削除
 
      document.getElementById("charge-form").submit();//フォームに記載されている情報をサーバーサイドへ送信
      document.getElementById("charge-form").reset();//フォームの入力内容をリセット
    });
  });
 };

 window.addEventListener("turbolinks:load", pay);//ページがロードされると関数「pay」が実行