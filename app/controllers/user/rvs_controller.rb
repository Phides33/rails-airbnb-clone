class User::RvsController < ApplicationController
  def index
    @rvs = current_user.rvs
  end

  def new
    @rv = Rv.new
  end
end
