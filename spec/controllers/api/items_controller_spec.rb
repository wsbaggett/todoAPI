require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

  let(:my_item) { create(:item) }

  describe "POST create" do

      it "assigns the new item to item" do
       post :create, item: {description: "MyToDoItem"}
       expect(assigns(:item)).to eq Item.last
     end
  end

end
