
require File.dirname "admin/publishers.yml"
require 'test_helper'
class Admin::PublishersControllerTest < ActionDispatch::IntegrationTest
  fixtures 'admin/publishers'
  setup do
    @admin_publisher = Admin::Publisher.first
  end

  test "should get index" do
    get admin_publishers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_publisher_url
    assert_response :success
  end

  test "should create admin_publisher" do
    assert_difference('Admin::Publisher.count') do
      post admin_publishers_url, params: { admin_publisher: { name: @admin_publisher.name + "dodane" } }
    end

    assert_redirected_to admin_publisher_url(Admin::Publisher.last)
  end

  test "should show admin_publisher" do
    get admin_publisher_url(@admin_publisher)
    assert_response :success
    assert_template 'admin/publishers/show'
    assert assigns(:admin_publisher).valid?
    assert_select 'h1', Admin::Publisher.first.name
  end

  test "should get edit" do
    get edit_admin_publisher_url(@admin_publisher)
    assert_response :success
  end

  test "should update admin_publisher" do
    patch admin_publisher_url(@admin_publisher), params: { admin_publisher: { name: "New name" } }
    assert_redirected_to admin_publisher_url(@admin_publisher)
    @admin_publisher.reload
    assert_equal 'New name', @admin_publisher.name
  end

  test "should destroy admin_publisher" do
    assert_difference('Admin::Publisher.count', -1) do
      delete admin_publisher_url(@admin_publisher)
    end

    assert_redirected_to admin_publishers_url
  end
end
