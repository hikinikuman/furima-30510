//document.addEventListener("turbolinks:load", function () {
  //$("#item_price").on("keyup", function () {
    //console.log("ok");
    //let price = $(this).val();
    //let fee = Math.round(price * 0.1);
    //let profit = price - fee;
    //$("#fee").text(fee);
    //$("#profit").text(profit);
  //});
//});


//window.addEventListener("load",()=>{

  //const priceInput = document.getElementById("item-price");
  //priceInput.addEventListener("input", () => {
    //const inputValue = priceInput.value;


    //const addTaxDom = document.getElementById("add-tax-price")    
    //addTaxDom.innerHTML = Math.floor(inputValue * 0.1);


    //const profitNumber = document.getElementById("profit")
    //const value_result = inputValue * 0.1

    //profitNumber.innerHTML = (Math.floor(inputValue - value_result));
      //console.log(profitNumber);
    //})
  //})

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
