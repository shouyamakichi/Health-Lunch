window.addEventListener('load', function(){
  // 新規商品投稿の価格設定
  let item_price = document.getElementById("item-price")
    item_price.addEventListener('input', function(){
      price = item_price.value 
      const add_tax_price = document.getElementById("add-tax-price")
        tax_price = add_tax_price
        tax_price.innerHTML = Math.floor(price * 1.1)
  }) 
  // 新規商品投稿の価格設定
})