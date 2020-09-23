class ProteinsController < ApplicationController
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
    @protein = Protein.find(params[:id])
  end

  def edit
    @protein = Protein.find(params[:id])
  end

  def update
    @protein = Protein.find(params[:id])
    if @protein.update(proteins_params)
      redirect_to protein_path
    else
      render :edit
    end
  end

  # def destroy
  # end


  private

  def proteins_params
    params.require(:protein).permit(:image, :name, :acount, :price,:energy, :prote, :salt, :Lipid, :carbo, :first, :second, :third, :forth, :fifth).merge(user_id: current_user.id)
  end

end