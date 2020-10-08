class CalosController < ApplicationController
   # ログインしていないユーザーはindex,show以外URL直接打ち込んでもトップ画面へ戻る
   before_action :authenticate_user!, except: [:index, :show]
   # ログインしていないユーザーはindex,show以外URL直接打ち込んでもトップ画面へ戻る
   #管理者のみnew,editへの遷移可能
   before_action :move_to_new, only: [:new, :edit]
   #管理者のみnew,editへの遷移可能
   before_action :item_seconds,  only: [:show, :edit, :update, :destroy]
 
    def index
     @calos = Calo.all
    end
   
    def new
     @calo = Calo.new
    end
   
    def create
      @calo = Calo.new(calos_params)
      if @calo.save
        redirect_to root_path
      else
        render :new
      end
    end
   
   def show
   end
   
   def edit
   end
   
  def update
     if @calo.update(calos_params)
       redirect_to calo_path
     else
       render :edit
     end
  end
   
   def destroy
     if @calo.destroy
       redirect_to calos_path
     else
       render :show
     end
   end
   
   
   
   private
   
   def calos_params
     params.require(:calo).permit(:image, :name, :price, :energy, :prote, :salt, :Lipid, :carbo, :first, :second, :third, :forth,:fifth).merge(user_id: current_user.id)
   end
   
   #管理者のみnew,editへURL直接打ち込んでの遷移可能
   def move_to_new
     unless current_user == @user || current_user.admin?
       redirect_to root_path
     end
   end
   #管理者のみnew,editへURL直接打ち込んでの遷移可能
   
 
   def item_seconds
     @calo = Calo.find(params[:id])
   end
  
  end
