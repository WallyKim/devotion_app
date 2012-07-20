class UploadController < ApplicationController
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
end
