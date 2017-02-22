class HomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to chains_path
    end
  end
end
