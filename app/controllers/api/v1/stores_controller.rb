class Api::V1::StoresController < ApplicationController
  def create
    store = Store.new(store_params)

    if store.save
      render json: { store: store }, status: 200
    else
      render json: { message: "Store not created" }, status: :invalid_entity
    end
  end

  private

    def store_params
      params.require(:store).permit(:name, :address)
    end
end
