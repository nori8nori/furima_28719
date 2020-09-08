const pay = () => {
  Payjp.setPublicKey("pb7f34b4");// PAY.JPテスト公開鍵。注意）公開鍵を残したままGitHubにプッシュしてはいけない
  const form = document.getElementById("charge-form");//charge-form内のsubmitが実行されるとイベントが発火
  form.addEventListener("submit", (e) => {
    e.preventDefault();
 
    // alert("OK")//ジャバスクが起動した瞬間に実行される。つまり、HPを開いた瞬間に「OK」が表示されなかったらジャバスク自体が起動していないということ

    const formResult = document.getElementById("charge-form");//入力ホーム全体のデータがここに入っている「form_with ~ end」
    const formData = new FormData(formResult);//全部撮ってきてそれをformデータとして認識される

    //クレカ情報を変数に代入している
    const card = {
      number: formData.get("number"),//クレカのナンバー
      cvc: formData.get("cvc"),//クレカのCVC
      exp_month: formData.get("ex_month"),//クレカの期限「月」
      exp_year: `20${formData.get("ex_year")}`//クレカの期限「年」
    };

    // console.log(card)

    // alert(formData.get("number"))//ジャバスクが起動した瞬間に実行される。つまり、HPを開いた瞬間に「OK」が表示されなかったらジャバスク自体が起動していないということ
    // alert(formData.get("cvc"))//クレカのCVC
    // alert(formData.get("ex_month"))//クレカの期限「月」
    // alert( `20${formData.get("ex_year")}`)//クレカの期限「年」

    
    Payjp.createToken(card, (status, response) => {

      // alert(status)
      // console.table(response)

      if (status == 200) { //PAY.JP側の処理でトークンの生成に成功した場合に、if文の中のコードが実行
        alert("O")
        const token = response.id;//生成されたトークンを変数に代入
        const renderDom = document.getElementById("charge-form");//生成する要素を取得
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;//生成するHTMLを定義
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