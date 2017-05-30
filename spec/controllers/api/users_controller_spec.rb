require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  let(:my_user) { create(:user) }


     before :each do
       # simiulate user and sign in
       #allow(controller).to receive(:authenticated?)
       user = 'TestUser1'
       pw = 'password'
       request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
     end

  describe "GET #index" do
    it "returns http success" do
       my_user

	     get :index
       expect(response).to have_http_status(:success)
    end

    it "assigns [my_user] to @users" do
       my_user

       get :index
       @users = User.all
       expect(@users).to eq([my_user])
    end
   end

   describe "DELETE destroy" do
     it "deletes the user" do
       User.find(my_user.id)
       expect(User.count).to eq 1
       delete :destroy, id: my_user.id
       #my_user.destroy
       expect(User.count).to eq 0
    end
    end

   describe "POST create" do

      new_username = "Walter"
      new_password = "password"

      it "increases the number of users by 1" do
        my_user

        expect{post :create, user: {username: new_username, password: new_password}}.to change(User,:count).by(1)
      end

      it "expect http status to return successful" do
        my_user

        post :create, user: {username: new_username, password: new_password}
        expect(response).to have_http_status(:success)
      end

   end

end
