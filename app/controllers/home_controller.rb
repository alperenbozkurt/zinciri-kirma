class HomeController < ApplicationController
  def index
    render layout: false
    if current_user.present?
      redirect_to chains_path
    end
  end
end
