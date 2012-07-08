require 'spec_helper'

describe "UserPages" do
  
  let(:base_title) { "New Person's Devotion App" }
  
  describe "User pages" do
    before { visit signup_path }
    
    it "should have the h1 'Sign up'" do
      page.should have_selector('h1', :text => 'Sign up')
    end

    it "should have the title 'Sign up'" do
      page.should have_selector('title', :text => "#{base_title} | Sign up")
    end
    
    # it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      # get user_pages_index_path
      # response.status.should be(200)
    # end
  end
  
end
