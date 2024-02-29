class Api::V1::ArticlesController < ApplicationController
  before_action :load_store, only: %i[create index calculate_bill]
  before_action :find_store_order, only: %i[show update edit calculate_bill]
  
  def create
    @order = @store.orders.create!(store_params)
  end

  def index
    @orders = @store.orders.where.not(status: :completed)
  end

  def show
  end

  def edit
  end

  def update
    @order.update!(order_params)
  end

  def calculate_bill
    CalculateOrderBill.call(order_id: @order.id)
  end

  private

    def order_params
      params.require(:order).permit(:status, :promotion_codes, :discount_codes)
    end

    def load_store
      @store = Store.find_by(id: 1)
      render "Store doesn't exists with #{params[:store_id]}" if @store.nil?
    end

    def find_store_order
      @store.orders.find(params[:id])
    end
end
