const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("money-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("money-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("bento_deli[number]"),
      cvc: formData.get("bento_deli[cvc]"),
      exp_month: formData.get("bento_deli[exp_month]"),
      exp_year: `20${formData.get("bento_deli[exp_year]")}`
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("money-form");
        const tokenObj = `<input value=${token} type="hidden" name='bento_deli[token]'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        console.log(token)
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("money-form").submit();
      document.getElementById("money-form").reset();
    });
  });
  };
window.addEventListener("load", pay);