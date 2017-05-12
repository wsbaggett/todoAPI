FactoryGirl.define do
  factory :list do
    name "MyToDoList"
    permissions "public"
    user 
  end
end
