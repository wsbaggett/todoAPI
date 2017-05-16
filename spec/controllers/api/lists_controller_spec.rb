require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list) }

  describe "POST create" do

      it "assigns the new list to list" do
       post :create, list: {name: "MyToDoList", permissions: "public"}
       expect(assigns(:list)).to eq List.last
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
