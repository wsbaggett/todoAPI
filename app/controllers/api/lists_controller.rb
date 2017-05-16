class Api::ListsController < ApiController

  before_action :authenticated?

  def create
    list = List.new(list_params)
    list.user = User.find(params[:user_id])
   if list.save
     render json: list
   else
     render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
   end
  end

  private
  def list_params
    params.require(:list).permit(:name, :permissions)
  end

end
