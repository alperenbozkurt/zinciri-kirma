class UsersController < ApplicationController
  def index
    @user = User.find_by(username: params[:username])
    if @user.nil?
      flash[:notice] = 'Kullanıcı bulunamadı. Silinmiş veya link yanlış girilmiş olabilir.'
      redirect_to chains_path
    end
  end
  def edit

  end
  def update

  end
end
