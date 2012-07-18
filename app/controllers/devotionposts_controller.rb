class DevotionpostsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @devotionpost = @category.devotionposts.create(params[:devotionpost])
    @devotionpost.bible_id = @category.bible_id
    
    if @devotionpost.save
      redirect_to root_path
    end
  end
  
  def edit
    @devotionpost = Devotionpost.find(params[:id])
  end
  
  def update
    @devotionpost = Devotionpost.find(params[:id])
    @category = Category.find(@devotionpost.category_id)

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
