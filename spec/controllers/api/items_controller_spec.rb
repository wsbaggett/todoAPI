require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do
  let(:my_list) { create(:list) }
  let(:my_item) { create(:item) }

  before :each do
    # simiulate user and sign in
    #allow(controller).to receive(:authenticated?)
    user = 'TestUser1'
    pw = 'password'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end

  describe "POST create" do

      it "increases the number of Items by 1" do
        my_list

        expect{post :create, list_id: my_list.id, item: {description: "MyToDoItem", completed: "false"}}.to change(Item,:count).by(1)
        Rails.logger.info response.body
      end

      it "expect http status to return successful" do
       my_list

       post :create, list_id: my_list.id, item: {description: "MyToDoItem", completed: "true"}
       expect(response).to have_http_status(:success)
      end
  end

  describe "PUT update" do
      it "updates the item" do

        new_description = "MyToDoItem2"
        new_completed = "true"

        put :update, id: my_item.id, item: {description: new_description, completed: new_completed}
        updated_item = Item.find(my_item.id)
			  expect(updated_item.completed).to eq new_completed
     end
  end


end
