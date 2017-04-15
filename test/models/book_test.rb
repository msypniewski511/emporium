require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should fail create without vailid attrybuties" do
  	book = Book.new
  	assert_not book.save
  	assert_equal 9, book.errors.size
  	assert book.errors[:title].any?
  	assert book.errors[:publisher].any?
  	assert book.errors[:authors].any?
  	assert book.errors[:published_at].any?
  	assert book.errors[:isbn].any?
  	assert book.errors[:page_count].any?
  	assert book.errors[:price].any?
  end

  test "should create book with valid attrybuts" do
  	book = Book.new(
  	  title: "Ruby for Toddlers",
  	  publisher_id: Admin::Publisher.first.id,
  	  published_at: Time.now,
  	  authors: Author.all,
  	  isbn: '123-123-123-1',
  	  blurb: 'The best book',
  	  page_count: 12,
  	  price: 10.0)

  	assert book.save
  end

  test  "has_many_and_belongs_to mapping test" do
    apress = Admin::Publisher.find_by_name("Apress")
    assert_equal 2, apress.books.size

    book = Book.new(
      title: "Rails E-Commerce 3nd Edition",
      authors: Author.all,
      published_at: Time.now,
      isbn: '123-123-123-9',
      blurb: "E-commercr on Rails",
      page_count: 300,
      price: 30.5)
    apress.books << book
    apress.reload
    book.reload
    assert_equal 3, apress.books.size
    assert_equal 'Apress', book.publisher.name
  end

  test "has and belongs to many authors" do
    book = Book.new(
      title: "Moja ksiazka",
      authors: Author.all,
      publisher: Admin::Publisher.first,
      published_at: Time.now,
      isbn: '123-123-123-1',
      blurb: "Cos tam",
      page_count: 300,
      price: 10)
    assert book.save

    book.reload
    assert_equal 2, book.authors.size
    assert_equal 2, Author.find_by_first_name('Joel').books.size
  end
end
