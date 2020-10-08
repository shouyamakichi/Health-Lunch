class SoftsController < ApplicationController
  # ログインしていないユーザーはindex,show以外URL直接打ち込んでもトップ画面へ戻る
  before_action :authenticate_user!, except: [:index, :show]
  # ログインしていないユーザーはindex,show以外URL直接打ち込んでもトップ画面へ戻る
  #管理者のみnew,editへの遷移可能
  before_action :move_to_new, only: [:new, :edit]
  #管理者のみnew,editへの遷移可能
  before_action :items_set,  only: [:show, :edit, :update, :destroy]


  def index
    @softs = Soft.all
  end
  
  def new
    @soft = Soft.new
  end
  
  def create
    @soft = Soft.new(softs_params)
    if @soft.save
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
    if @soft.update(softs_params)
      redirect_to soft_path
    else
      render :edit
    end
  end
  
  def destroy
    if @soft.destroy
      redirect_to softs_path
    else
      render :show
    end
  end
  
  
  
  private
  
  def softs_params
    params.require(:soft).permit(:image, :name, :price, :energy, :prote, :salt, :Lipid, :carbo, :first, :second, :third, :forth,:fifth).merge(user_id: current_user.id)
  end
  
  #管理者のみnew,editへURL直接打ち込んでの遷移可能
  def move_to_new
    unless current_user == @user || current_user.admin?
      redirect_to root_path
    end
  end
  #管理者のみnew,editへURL直接打ち込んでの遷移可能
  

  def items_set
    @soft = Soft.find(params[:id])
  end

end

