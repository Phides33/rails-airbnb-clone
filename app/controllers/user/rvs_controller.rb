class User::RvsController < ApplicationController
  def index
    @rvs = current_user.rvs
  end
end
