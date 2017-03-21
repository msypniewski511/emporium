require 'test_helper'

class Admin::AuthorControllerTest < ActionDispatch::IntegrationTest
  fixtures :authors

  test "should get new" do
    get new_admin_author_path
    assert_response :success
    assert_template 'admin/authors/new'
    assert_select 'h1', 'Create new author'
  end

  test "should get create" do
    assert_difference('Author.count') do
      post admin_authors_path, params: { first_name: "Maciek", last_name: "Zdunski" }
    end
    assert_response :redirect
    assert_redirected_to admin_authors_path
    assert_equal "Author Maciek Zdunski was successfully created.", flash[:notice]
  end

  test "should failing create" do
    assert_no_difference('Author.count') do
      post admin_authors_path, params: { first_name: "Maciek" }
      assert_response :success
      assert_template 'admin/authors/new'
    end
  end

  test "should get edit" do
    get edit_admin_author_path(authors(:joel_spolsky))
    assert_response :success
    assert_select 'input[name=?]', 'first_name'
    assert_select 'input[value=?]', "#{authors(:joel_spolsky).first_name}"
    assert_select 'input[name=?]', 'last_name'
    assert_select 'input[value=?]', "#{authors(:joel_spolsky).last_name}"
  end

  test "should update" do
    author = authors(:joel_spolsky)
    put admin_author_url(author), params: {first_name: "Maciej", last_name: "Sypniewski" }
    assert_response :redirect
    assert_redirected_to admin_author_path, params: {id: authors(:joel_spolsky).id }
    author.reload
    assert_equal 'Maciej', author.first_name
  end

  test "should get destroy" do
    author = authors(:joel_spolsky)
    assert_difference('Author.count', -1) do
       delete admin_author_path(author)
       assert_response :redirect
       assert_redirected_to admin_authors_path
     end
     assert_redirected_to admin_authors_path
     follow_redirect!
     assert_select 'div[id=?]', 'notice'
  end

  test "should get show" do
    author = authors(:joel_spolsky)
    get admin_author_path(author)
    assert_template 'admin/authors/show'
    assert_equal 'Joel', assigns(:author).first_name
    assert_equal 'Spolsky', assigns(:author).last_name
    assert_response :success
  end

  test "should get index" do
    get admin_authors_path
    assert_response :success
    Author.all.each do |a|
      assert_select 'td', "#{a.name}"
    end
  end

end
