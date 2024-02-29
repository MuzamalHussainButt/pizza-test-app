class CalculateOrderBill
  class << self
    def call(order_id: order_id)
      order = Order.find_by(id: order_id)
      itmes = order.items
      prices = items&.first.prices
      
      return if order.nil? || items.empty?
      multiplier = price&.multiplier
      total_price = calculate_bill(order, items)
      promotion_codes(order.promotion_codes, order.base_price, items, multiplier, total_price)
    end

    private

      def calculate_bill(order, items)
        bill = 0.0
        items.each do |item|
          base_price = item.base_price
          prices = item.prices
          total_price = item_prices(prices, base_price)
          bill+=total_price
        end
        bill
      end

      def item_prices(prices, base_price)
        total_price = 0.0
        prices.each do |price|
          case price.variant
          when "small", :small
            total_price += base_price * price.multiplier
          when "large", :large
            total_price += base_price * price.multiplier
          when "medium", :medium
            total_price += base_price * price.multiplier
          end
        end

        discount_code(order.discount_code, total_price)
      end

      def discount_code(discount_code, total_price)
        return total_price if discount_code.nil?

        (total_price/100) * (discount_code)
      end

      def promotion_codes(promotion_codes, base_price, items, multiplier, total_price)
        items = items.joins(:pirces).where(prices: {variant: promotion_codes})
        
        return if items.empty?
        
        billing_item = items.count/ 2

        total_price - ((base_price * multiplier) * billing_item)
      end
  end
end