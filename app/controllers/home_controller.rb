class HomeController < ApplicationController
  layout "landing"
  skip_before_action :authenticate_user!

  def index
  end
end
