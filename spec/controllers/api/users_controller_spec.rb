require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  let(:my_user) { create(:user) }

  describe "GET #index" do

    it "assigns my_user to @users" do
         get :index
         expect(assigns(:users)).to eq([my_user])
       end
   end

end
