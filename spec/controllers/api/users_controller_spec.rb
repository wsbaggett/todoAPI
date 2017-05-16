require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  let(:user) { create(:user) }

  describe "GET #index" do
    it "assigns [user] to @users" do
       get :index
       expect(assigns(@users)).to eq([user])
     end
   end

   describe "POST create" do

       it "assigns the new user to @user" do
        post :create, user: {username: "Bloc User", password: "password"}
        expect(assigns(:user)).to eq User.last
      end
   end

   describe "DELETE destroy" do
     it "deletes the user" do
      delete :destroy, {id: user.id}

      count = User.where({id: user.id}).size
      expect(count).to eq 0
    end
    end

end
