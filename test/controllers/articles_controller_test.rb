require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get sports" do
    get :sports
    assert_response :success
  end

end
