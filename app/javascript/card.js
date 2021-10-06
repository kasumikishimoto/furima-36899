const pay = () => {
  Payjp.setPublicKey("pk_test_d3f41b6cdb95c6bce67d6c85");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("form[number]"),
      exp_month: formData.get("form[exp_month]"),
      exp_year: `20${formData.get("form[exp_year]")}`,
      cvc: formData.get("form[cvc]")
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);