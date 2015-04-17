class Api::V1::CancersController < ApplicationController

  def index
    @cancers = Cancer.all
  end

  def show
    @cancer = Cancer.find(params[:id])
  end

end