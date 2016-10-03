class Api::BenchesController < ApplicationController

  def show
    @bench = Bench.find(params[:id])
  end

  def index
    @benches = Bench.all()
    render :index
  end

  def create
    debugger
    @bench = Bench.new(bench_params)
    if @bench.save!
      render('api/benches/show')
    else
      render json: "Invalid Credentials", status: 401
    end
  end

  def bench_params
    params.require(:bench).permit(:lat, :lng, :description)
  end
end
