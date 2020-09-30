const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("card-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("card-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buyer_delivery[number]"),
      cvc: formData.get("buyer_delivery[cvc]"),
      exp_month: formData.get("buyer_delivery[exp_month]"),
      exp_year: `20${formData.get("buyer_delivery[exp_year]")}`
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("card-form");
        const tokenObj = `<input value=${token} type="hidden" name='buyer_delivery[token]'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        console.log(token)
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("card-form").submit();
      document.getElementById("card-form").reset();
    });
  });
  };
window.addEventListener("load", pay);