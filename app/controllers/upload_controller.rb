class UploadController < ApplicationController
  before_filter :signed_in_user, only: [:uploadFile]
  before_filter :admin_user,     only: :uploadFile

  def index
  end
  
  def adhoc
    redirect_to 
  end
  
  def uploadFile
      uploaded_io = params[:file]
 
      File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
         file.write(uploaded_io.read)
      end
      respond_to do |format|
         format.html { redirect_to "/upload/index", :notice => "File uploaded"}
      end
   end
   
   private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
    
    def admin_user
      if !current_user.admin?
        redirect_to root_path, notice: "Permission only admin user."
      end
    end
end
