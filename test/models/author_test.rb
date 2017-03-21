require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "shuld get full name" do
  	author = Author.create(first_name: "Maciej", last_name: "Sypniewski")
  	assert_equal 'Maciej Sypniewski', author.name
  end
end
