class PetitionsController < ApplicationController

  def show
    @petition = Petition.includes(:comments).find_by(id: params[:id])
  end
end
