class DevotionpostsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :create, :destroy]
  before_filter :correct_user,   only: :destroy
  
  def new
    @category_id = params[:id]
    @devotionpost = Devotionpost.new
  end
  
  def create
    @category_id = params[:devotionpost][:bible_id]
    @category = Category.find(@category_id)
    @devotionpost = @category.devotionposts.create(params[:devotionpost])
    # @devotionpost.bible_id = @category.bible_id
    
    @introlength = @devotionpost.intro.length
    @contentlength = @devotionpost.content.length
    @applicationlength = @devotionpost.application.length
    
    if @devotionpost.save
      # redirect_to root_path
      redirect_to @category, notice: 'Post was successfully created.'
    else
      render action: "new"
    end
  end
  
  def edit
    @devotionpost = Devotionpost.find(params[:id])
  end
  
  def update
    @devotionpost = Devotionpost.find(params[:id])
    @category = Category.find(@devotionpost.category_id)
    
    @introlength = @devotionpost.intro.length
    @contentlength = @devotionpost.content.length
    @applicationlength = @devotionpost.application.length

    respond_to do |format|
      if @devotionpost.update_attributes(params[:devotionpost])
        format.html { redirect_to @category, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @devotionpost.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @category = Category.find(params[:category_id])
    @devotionpost = @category.devotionposts.find(params[:id])
    @devotionpost.destroy
    redirect_to root_path
  end
end
