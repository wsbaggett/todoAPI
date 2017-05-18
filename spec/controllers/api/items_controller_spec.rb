require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do
  let(:my_list) { create(:list) }
  let(:my_item) { create(:item) }

  describe "POST create" do

      it "assigns the new item to item" do
       post :create, list_id: my_list.id, item: {description: "MyToDoItem", completed: "false"}
       expect(assigns(:item)).to eq Item.last
     end
  end

  describe "PUT update" do
      it "updates the item" do

        new_description = "MyToDoItem2"
        new_completed = "true"

        #put :update, id: my_item.id, item: {description: new_description, completed: new_completed}
			  my_item.update(completed: new_completed)
			  expect(my_item.completed).to eq new_completed
     end
  end


end
