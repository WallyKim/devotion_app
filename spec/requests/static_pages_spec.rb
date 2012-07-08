require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "New Person's Devotion App" }

  describe "Home page" do
    before { visit root_path }
    
    it "should have the h1 'Welcome to the Devotion App'" do
      page.should have_selector('h1', :text => 'Welcome to the Devotion App')
    end

    it "should have the title 'Home'" do
      page.should have_selector('title', :text => "#{base_title} | Home")
    end
  end

  describe "Help page" do
    before { visit help_path }

    it "should have the h1 'Help'" do
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  describe "About page" do
    before { visit about_path }

    it "should have the h1 'About Us'" do
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end

  describe "Contact page" do
    before { visit contact_path }

    it "should have the h1 'Contact'" do
      page.should have_selector('h1', :text => 'Contact')
    end

    it "should have the title 'Contact'" do
      page.should have_selector('title', :text => "#{base_title} | Contact")
    end
  end

end