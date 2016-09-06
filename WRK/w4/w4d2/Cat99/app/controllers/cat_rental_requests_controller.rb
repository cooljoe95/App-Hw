class CatRentalRequestsController < ApplicationController

  def index
    @requests = CatRentalRequest.all
    render json: @requests
  end
  



end
