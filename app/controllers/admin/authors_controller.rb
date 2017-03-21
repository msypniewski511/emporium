class Admin::AuthorsController < ApplicationController
  def new
    @author = Author.new
    @page_title = "Create new author"
  end

  def create
    @author = Author.new(get_params)
    if @author.save
      flash[:notice] = "Author #{@author.name} was successfully created."
      redirect_to admin_authors_path
    else
      @page_title = 'Create new author'
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
    @page_title = 'Edit author'
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(get_params)
      flash[:notice] = 'Author was successfully updated.'
      redirect_to admin_author_path, id: @author
    else
      @page_title = "Edit author"
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    flash[:notice] = "Successfully deleted author #{@author.name}"
    redirect_to admin_authors_path
  end

  def show
    @author = Author.find(params[:id])
    @page_title = @author.name
  end

  def index
    @authors = Author.all
    @page_title = "Listing authors."
  end

  private
  
  def get_params
    params.permit(:first_name, :last_name)
  end
end
