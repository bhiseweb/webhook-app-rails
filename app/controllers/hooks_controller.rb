class HooksController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def index
    @hooks = Hook.paginate page: params[:page], per_page: 10
  end
  
  def create
    data = JSON.parse(request.body.read)
    Hook.create(data: data)
    head :ok
  end
  
end
