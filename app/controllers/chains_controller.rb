class ChainsController < ApplicationController
  def index
    @chains = Chain.all
  end
  def new
    @chain = Chain.new
  end
  def create
    @chain = Chain.new(strong_params)
    if @chain.save
      flash[:Successfully] = "Successfully created..."
      redirect_to chains_path
    else
      flash[:error] = "İşlem Başarısız..."
      render :new
    end
  end
  def destroy
    @chain = Chain.find(params[:id])
    @chain.destroy
    flash[:Successfully] = "Successfully created..."
    redirect_to chains_path
  end
  def show
      @gun = 86400
      @fix = (Time.new).yday
  end
  private
  def strong_params
    params.require(:chain).permit(:name,:desc,:break)
  end
end
