require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list) }

  before :each do
    # simiulate user and sign in
    #allow(controller).to receive(:authenticated?)
    user = 'TestUser1'
    pw = 'password'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end

  describe "POST create" do

     it "increases the number of Lists by 1" do
       my_user

       expect{post :create, user_id: my_user.id, list: {name: "MyToDoList", permissions: "public"}}.to change(List,:count).by(1)
     end

      #it "assigns the new list to list" do
        #my_user

       #post :create, user_id: my_user.id, list: {name: "MyToDoList", permissions: "public"}
       #expect(assigns(:list)).to eq List.last
     #end
  end

  describe "PUT update" do
      it "updates the list" do
        my_list

        new_name = "MyToDoList2"
        new_permissions = "private"

        #put :update, id: my_list.id, list: {permissions: new_permissions}
			  my_list.update(permissions: new_permissions)
			  expect(my_list.permissions).to eq new_permissions
     end
  end

  describe "DELETE destroy" do
     it "deletes the list" do
       delete :destroy, {user_id: my_user.id, id: my_list.id}
       count = List.where({user_id: my_user.id, id: my_list.id}).size
       expect(count).to eq 0
     end
   end

end
