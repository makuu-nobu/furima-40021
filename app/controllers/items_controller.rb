class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    before_action :move_to_session, except: [:index, :show]
    def index
        @items = Item.includes(:user, :purchase).order("created_at DESC")     
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

    def show
        if user_signed_in? && @item.user.id == current_user.id && @item.purchase.present?
            redirect_to root_path
        end
    end

    def edit 
        if current_user != @item.user
            redirect_to root_path
        end
    end

    def update
        if @item.update(item_params)
            redirect_to item_path(params[:id])
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        if current_user != @item.user
            redirect_to root_path
        else
            @item.destroy
            redirect_to root_path
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

    def set_item
        @item = Item.find(params[:id])
    end
end
