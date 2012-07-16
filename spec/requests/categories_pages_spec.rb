require 'spec_helper'

describe "CategoriesPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "category creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a category" do
        expect { click_button "Post" }.should_not change(Category, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'category_title', with: "Lorem ipsum" }
      it "should create a category" do
        expect { click_button "Post" }.should change(Category, :count).by(1)
      end
    end
  end
end
