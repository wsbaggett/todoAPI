require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  let(:my_user) { create(:user) }

  describe "GET #index" do
    it "assigns [my_user] to @users" do
       get :index
       expect(assigns(@users)).to eq([my_user])
     end
   end

   describe "POST create" do

       it "assigns the new user to @user" do
        post :create, user: {username: "Bloc User", password: "password"}
        expect(assigns(:user)).to eq User.last
      end
   end

end
