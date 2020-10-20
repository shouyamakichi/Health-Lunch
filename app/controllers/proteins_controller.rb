class ProteinsController < ApplicationController

  # ログインしていないユーザーはindex,show以外URL直接打ち込んでもトップ画面へ戻る
  before_action :authenticate_user!, except: [:index, :show]
  # ログインしていないユーザーはindex,show以外URL直接打ち込んでもトップ画面へ戻る
  #管理者のみnew,editへの遷移可能
  before_action :move_to_new, only: [:new, :edit]
  #管理者のみnew,editへの遷移可能
  before_action :item_set,  only: [:show, :edit, :update, :destroy]

  def index
    @proteins = Protein.all
  end
  
  def new
    @protein = Protein.new
  end
  
  def create
    @protein = Protein.new(proteins_params)
    if @protein.save
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
    if @protein.update(proteins_params)
      redirect_to protein_path
    else
      render :edit
    end
  end
  
  def destroy
    if @protein.destroy
      redirect_to proteins_path
    else
      render :show
    end
  end
  
  
  
  private

  
  #管理者のみnew,editへURL直接打ち込んでの遷移可能
  def move_to_new
    unless current_user == @user || current_user.admin?
      redirect_to root_path
    end
  end
  #管理者のみnew,editへURL直接打ち込んでの遷移可能
  

  def item_set
    @protein = Protein.find(params[:id])
  end

    def proteins_params
      params.require(:protein).permit(:image, :name, :price, :energy, :prote, :salt, :Lipid, :carbo, :first, :second, :third, :forth,:fifth).merge(user_id: current_user.id)
    end



end
