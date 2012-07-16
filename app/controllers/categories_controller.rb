class CategoriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @category = current_user.categories.build(params[:category])
    
    if @category.title == 'Genesis'
      @category[:title] = nil
      @category[:title] = '창세'
      @category[:bible_id] = 1
    end
    
    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end
end
