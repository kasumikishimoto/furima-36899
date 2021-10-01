window.addEventListener('load', ()=> {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("input", ()=> {
    const PriceValue = itemPrice.value;

  const addTaxPrice = document.getElementById("add-tax-price");
  addTaxPrice.innerHTML = Math.round(itemPrice.value*0.1);
  const profit = document.getElementById("profit");
  profit.innerHTML = Math.round(itemPrice.value-Math.round(itemPrice.value*0.1))
  });
});