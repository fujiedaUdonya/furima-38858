const pay = () => {
  
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  // console.log(process.env.PAYJP_PUBLIC_KEY)) 環境変数呼び込みのための記述
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
      payjp.createToken(numberElement).then(function (response) {
        if (response.error) {
        } else {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden">`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        } 

        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear()
        document.getElementById("charge-form").submit();
         
      });
  });
};

window.addEventListener("load", pay);


// console.log('取得したいデータ名') memo:取得したいデータの中身はなにか見る 
