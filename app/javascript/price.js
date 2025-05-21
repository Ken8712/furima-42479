function price (){
  const form = document.getElementById("item-price")
  const taxPriceItem = document.getElementById("add-tax-price")
  const profitItem = document.getElementById("profit")



  console.log(form)
  form.addEventListener("input",() => {
    console.log(form.value)
    const currentInput = form.value
    const taxPrice = Math.floor(currentInput * 0.1)
    const profit = Math.floor(currentInput - taxPrice)
    taxPriceItem.innerHTML = taxPrice.toLocaleString("ja-JP")
    profitItem.innerHTML = profit.toLocaleString("ja-JP")


  });
};

window.addEventListener('turbo:load', price);