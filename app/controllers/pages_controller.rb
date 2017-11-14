class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @rvs = Rv.all
  end
end
