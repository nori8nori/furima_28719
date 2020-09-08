const pay = () => {
  Payjp.setPublicKey("pk_test_4");// PAY.JPテスト公開鍵。注意）公開鍵を残したままGitHubにプッシュしてはいけない
  const form = document.getElementById("charge-form");//charge-form内のsubmitが実行されるとイベントが発火
  form.addEventListener("submit", (e) => {
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    //クレカ情報を変数に代入している
    const card = {
      number: formData.get("number"),//クレカのナンバー
      cvc: formData.get("cvc"),//クレカのCVC
      exp_month: formData.get("exp_month"),//クレカの期限「月」
      exp_year: `20${formData.get("exp_year")}`,//クレカの期限「年」
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) { //PAY.JP側の処理でトークンの生成に成功した場合に、if文の中のコードが実行
        const token = response.id;//生成されたトークンを変数に代入
        const renderDom = document.getElementById("charge-form");//生成する要素を取得
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;//生成するHTMLを定義
        renderDom.insertAdjacentHTML("beforeend", tokenObj);//formの最後に生成
      }

      //入力された各カード情報がパラメーターとして送られないように、値を削除
      document.getElementById("number").removeAttribute("name");//クレカのナンバー情報削除
      document.getElementById("cvc").removeAttribute("name");//クレカのcvc情報削除
      document.getElementById("exp_month").removeAttribute("name");//クレカの「月」情報削除
      document.getElementById("exp_year").removeAttribute("name");//クレカの「年」情報削除
 
      document.getElementById("charge-form").submit();//フォームに記載されている情報をサーバーサイドへ送信
      document.getElementById("charge-form").reset();//フォームの入力内容をリセット
    });
  });
 };
 
 window.addEventListener("load", pay);//ページがロードされると関数「pay」が実行