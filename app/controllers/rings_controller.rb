class RingsController < ApplicationController
  def create
    @chain = Chain.find(params[:chain_id])
    @ring = Ring.new(strong_params)
    @ring.day = (Time.new).yday
    @ring.chain_id = params[:chain_id]
    if @chain.rings.where(day: (Time.new).yday).any?
      update
    elsif
      if @ring.save
        flash[:Successfully] = "Successfully created..."
        redirect_to chains_path
      else
        flash[:error] = "İşlem Başarısız..."
        render :new
      end
    end
  end
  def new
    @chain = Chain.find(params[:chain_id])
    @ring = Ring.new
  end
  private
  def strong_params
    params.require(:ring).permit(:info)
  end
  def update
    @chain = Chain.find(params[:chain_id])
    @ring = Ring.find(@chain.rings.where(day: (Time.new).yday).first)
    @ring.info = params[:ring][:info]
    if @ring.save
      flash[:Successfully] = "Güncelleme Başarılı..."
      redirect_to chains_path
    else
      flash[:error] = "Güncelleme Başarısız..."
      render :new
    end
  end
end
