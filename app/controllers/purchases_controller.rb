class PurchasesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_item, only: [:index, :create]
    def index
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
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
            gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
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
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
            Payjp::Charge.create(
                amount: @item.price,
                card: ship_params[:token],
                currency: 'jpy'
            )
    end
end
