class ProteinsController < ApplicationController
  def index
  end

  def new
    @protein = ItemProtein.new
  end

  def create
    @protein = ItemProtein.new(protein_params)
  end

  def show
  end

  private

  def protein_params
    params.require(:item_protein).permit(:name, :acount, :price, :energy, :prote, :salt, :Lipid, :carbo)
  end