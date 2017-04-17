require 'test_helper'

class BookFlowTest < ActionDispatch::IntegrationTest
  #fixtures :publishers, :authors

  test "test book administration" do
  	publisher = Admin::Publisher.create(name: 'Books for dummies')
  	author = Author.create(first_name: 'Bobo', last_name: 'Bar')

  	maciej = new_session_as(:maciej)
  	ruby_for_dumies = maciej.add_book book: {
  	  title: 'Ruby for dumies',
  	  publisher_id: Admin::Publisher.first.id,
  	  author_ids: [Author.first.id, Author.second.id],
  	  published_at: Time.now,
  	  isbn: '123-123-123-4',
  	  blurb: "Cos tam",
  	  page_count: 300,
  	  price: 100
  	}
    maciej.list_books
  end

  private

  module BookTestDSL
  	attr_writer :name

    def list_books
      get admin_books_path
      assert_response :success
      assert_template 'admin/books/index'
    end

  	def add_book(parameters)
      author = Author.first
      publisher = Admin::Publisher.first

      get new_admin_book_path
      assert_response :success
      assert_template "admin/books/new"
      assert_select "select"
      assert_select "option"

  	  post books_path, params: parameters
  	  assert_response :redirect
  	  follow_redirect!
  	  assert_response :success
  	  assert_select 'td'
  	end

  end

  def new_session_as(name)
  	open_session do |session|
  	  session.extend(BookTestDSL)
  	  session.name = name
  	  yield session if block_given?
  	end
  end
end
