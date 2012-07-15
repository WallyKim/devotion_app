require 'spec_helper'

describe Category do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @category = user.categories.build(title: "Lorem ipsum") }

  subject { @category }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Category.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @category.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank title" do
    before { @category.title = " " }
    it { should_not be_valid }
  end
end
