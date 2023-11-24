class PurchasesController < ApplicationController
    before_action :authenticate_user!
    def index
        @item = Item.find(params[:item_id])
        if @item.user == current_user
            redirect_to root_path
        end
        @buying = Buying.new
    end

    def create
        @buying = Buying.new(ship_params)
        if @buying.valid?
            @buying.save
            redirect_to root_path
        else
            render :index, status: :unprocessable_entity
        end
    end

    private
    def ship_params
        params.permit(:post_code, :region_id, :manicipality, :address, :add_address, :tell_address, :item_id).merge(user_id: current_user.id)
    end
end
