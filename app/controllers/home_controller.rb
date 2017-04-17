class HomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to chains_path and return
    end
    render layout: false
  end
end
