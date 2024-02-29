2.times do
  store = Store.create!(name:"name", address: "address")
  order = store.orders.create!(promotion_codes: "2323", discount_codes: "232", status: :completed)
  item = order.items.create!(name: "pizze", base_price: 10)
  item.prices.create!(variant: :small, multiplier: 1)
end


