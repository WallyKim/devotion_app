class CategoriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @category = current_user.categories.build(params[:category])
    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end
