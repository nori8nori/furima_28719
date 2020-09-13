// 関数定義
const math = () => {

  const input = document.getElementById('item-price')
  const tax = document.getElementById('add-tax-price')
  const profit = document.getElementById('profit')

  input.addEventListener('input',kakaku)

  function kakaku(e){
      tax.textContent = e.target.value / 10;
      profit.textContent = e.target.value - ( e.target.value /10 );
  }
}

// HPの情報の読み込みが全て終わったら後ろの関数を実行する
window.addEventListener("turbolinks:load",math);