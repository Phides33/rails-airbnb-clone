class RvsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @rvs = Rv.all
  end
  def show
    @rv = Rv.find(params[:id])
  end
end
