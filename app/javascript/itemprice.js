window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitResult = document.getElementById('profit');
    // addTaxDom.innerHTML = ""
    
    if (priceInput && addTaxDom && profitResult)  {
      priceInput.addEventListener("input", () => {
        const inputValue = parseFloat(priceInput.value);
  
        if (!isNaN(inputValue)) {
          // ここで実際の計算を行う（サンプルでは10%として計算）
          const calculatedTax = Math.floor(inputValue * 0.1);
          const profit = inputValue - calculatedTax;
          // 計算結果を表示
          addTaxDom.innerHTML = ` ${calculatedTax} `;
          profitResult.innerHTML = `${profit} `;
        } else {
          // 有効な金額が入力されていない場合はメッセージを表示
          addTaxDom.innerHTML = "有効な金額を入力してください";
          profitResult.innerHTML = "";
        }
      })
    };
  })
})