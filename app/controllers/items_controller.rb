class ItemsController < ApplicationController
    before_action :move_to_session, except: [:index, :show]
    def index
        @items = Item.all.order("created_at DESC")        
    end

    def new
        @item = Item.new        
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to root_path            
        else
            render :new, status: :unprocessable_entity
        end
        
    end

    private
    def item_params
        params.require(:item).permit(:image, :name, :content, :category_id, :situation_id, :charge_id, :region_id, :how_long_id, :price).merge(user_id: current_user.id)
    end

    def move_to_session
        unless user_signed_in?
            redirect_to new_user_session_path
        end
    end
end
