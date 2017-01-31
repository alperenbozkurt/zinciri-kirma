class ChainsController < ApplicationController
  before_action :chain_owner, only: [:destroy, :show]
  def index
    @chains = Chain.where(user_id: current_user.id)
    @ring = Ring.new
  end
  def new
    @chain = Chain.new
  end
  def create
    @chain = Chain.new(strong_params)
    @chain.user_id = current_user.id
    if @chain.save
      flash[:Successfully] = "Successfully created..."
      redirect_to chains_path
    else
      flash[:error] = "İşlem Başarısız..."
      render :new
    end
  end
  def destroy
    @chain.destroy
    flash[:Successfully] = "Successfully created..."
    redirect_to chains_path
  end
  def show
      @time = (Time.new).yday
  end
  private
  def strong_params
    params.require(:chain).permit(:name,:desc,:break)
  end
  def chain_owner
    @chain = Chain.find(params[:id])
    unless current_user.id == @chain.user_id
      flash[:error] = 'Erişim Yetkin yok.'
      redirect_to chains_path
     end
  end
end
