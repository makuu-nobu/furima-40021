class PurchasesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_item, only: [:index, :create]
    def index
        if @item.user == current_user
            redirect_to root_path
        end
        @buying = Buying.new
    end

    def create
        @buying = Buying.new(ship_params)
        if @buying.valid?
            pay_item
            @buying.save
            redirect_to root_path
        else
            render :index, status: :unprocessable_entity
        end
    end

    private
    def ship_params
        params.permit(:post_code, :region_id, :manicipality, :address, :add_address, :tell_address,:item_id).merge(user_id: current_user.id, token: params[:token])
    end

    def set_item
        @item = Item.find(params[:item_id])         
    end

    def pay_item
        Payjp.api_key = "sk_test_9ca4b587b4489b7632cc8e73"
            Payjp::Charge.create(
                amount: @item.price,
                card: ship_params[:token],
                currency: 'jpy'
            )
    end
end
