function item_new(){
  const inputPrice = document.getElementById("item-price");
  const inputTax = document.getElementById("add-tax-price");
  const inputProfit = document.getElementById("profit");

  inputPrice.addEventListener("input", () => {
    const inputValue = inputPrice.value;
  
    inputTax.innerHTML = `${Math.floor(inputValue * 0.1)}`
    inputProfit.innerHTML = `${Math.floor(inputValue - (inputValue * 0.1) )}`
  });
};

window.addEventListener('load', item_new);