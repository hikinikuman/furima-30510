window.addEventListener("load",()=>{
  const ItemPrice  = document.getElementById("item-price");
  ItemPrice.addEventListener("keyup", () => {
    const price = ItemPrice.value;
    const fee = Math.round(price * 0.1);

    const AddTaxPrice  = document.getElementById("add-tax-price");
    AddTaxPrice.innerHTML = fee

    const Profit = document.getElementById("profit")
    Profit.innerHTML = price - fee;

  });
})
