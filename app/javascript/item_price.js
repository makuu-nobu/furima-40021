const priceInput = document.getElementById('item-price');
const addTaxPriceElement = document.getElementById('add-tax-price');
const profitElement = document.getElementById('profit');

function calculateValues() {
    const price = parseFloat(priceInput.value);

    if (!isNaN(price)) {
        const taxPrice = price * 0.1;
        addTaxPriceElement.textContent = taxPrice.toFixed();

        const profit = price - taxPrice;
        profitElement.textContent = profit.toFixed();
    } else {
        addTaxPriceElement.textContent = "";
        profitElement.textContent = "";
    }
}
// 初回の計算
calculateValues();

// 'item-price'の値が変更されたときのイベントリスナーを追加
priceInput.addEventListener('input', function() {
    calculateValues();
});