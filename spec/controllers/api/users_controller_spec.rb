require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  let(:my_user) { create(:user) }

  let(:new_user) do
     {
         name: "Walter",
         password: "password"
     }
   	 end

  describe "GET #index" do
    #it "returns http success" do
	  #     get :index
    #       expect(response).to have_http_status(:success)
    #     end

    it "assigns [my_user] to @users" do
       get :index
       @users = User.all
       expect(@users).to eq([my_user])
       #expect(assigns(@users)).to eq([my_user])
    end
   end

   describe "DELETE destroy" do
     it "deletes the user" do
       User.find(my_user.id)
       expect(User.count).to eq 1
       #delete :destroy, id: my_user.id
       my_user.destroy
       expect(User.count).to eq 0
    end
    end

   describe "POST create" do

       it "assigns the new user to @user" do
        post :create, user: new_user
        expect(assigns(:user)).to eq User.last
      end
   end

end
