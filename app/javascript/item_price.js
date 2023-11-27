const itemPrice = () => {
    const itemPriceInput = document.getElementById('item-price');
    const addTaxPriceElement = document.getElementById('add-tax-price');
    const profitElement = document.getElementById('profit');

    // イベントリスナーを追加
    const updatePrice = () => {
    // item-priceの値を取得
        const itemPrice = parseFloat(itemPriceInput.value);

        // 値が数字であるかチェック
        if (!isNaN(itemPrice)) {
            // 販売手数料の計算（10%）
            const taxPrice = itemPrice * 0.1;
            addTaxPriceElement.textContent = taxPrice.toFixed();
            // 販売利益の計算
            const profit = itemPrice - taxPrice;
            profitElement.textContent = profit.toFixed();
                } else {
            }
    };
    itemPriceInput.addEventListener('input', updatePrice);
    itemPriceInput.addEventListener('render', updatePrice);
};

window.addEventListener('turbo:load', itemPrice);
window.addEventListener('turbo:render', itemPrice);