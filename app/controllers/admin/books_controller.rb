class Admin::BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]


  def index
    @books = Book.all
    @page_title = "Lista tytulow"
  end

  # GET /admin/publishers/1
  # GET /admin/publishers/1.json
  def show
    @page_title = @book.title
  end

  # GET /admin/publishers/new
  def new
    @book = Book.new
    @page_title = "Nowa ksiazka"
  end

  # GET /admin/publishers/1/edit
  def edit
  end

  # POST /admin/publishers
  # POST /admin/publishers.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to admin_books_path(@book), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/publishers/1
  # PATCH/PUT /admin/publishers/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to admin_books_path(@book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/publishers/1
  # DELETE /admin/publishers/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to admin_books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :publisher_id, :author_ids, :published_at, :isbn, :page_count, :price)
    end
end
