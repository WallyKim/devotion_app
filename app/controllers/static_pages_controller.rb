class StaticPagesController < ApplicationController
  
  def home
    @category = current_user.categories.build if signed_in?
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
