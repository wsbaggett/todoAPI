require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do
  let(:my_list) { create(:list) }

  describe "POST create" do

      it "assigns the new list to list" do
       post :create, list: {name: "MyToDoList", permissions: "public"}
       expect(assigns(:list)).to eq List.last
     end
  end

end
