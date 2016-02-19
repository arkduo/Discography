require 'test_helper'

class TunesControllerTest < ActionController::TestCase
  setup do
    @tune = tunes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tunes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tune" do
    assert_difference('Tune.count') do
      post :create, tune: { artist: @tune.artist, genre: @tune.genre, name: @tune.name }
    end

    assert_redirected_to tune_path(assigns(:tune))
  end

  test "should show tune" do
    get :show, id: @tune
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tune
    assert_response :success
  end

  test "should update tune" do
    patch :update, id: @tune, tune: { artist: @tune.artist, genre: @tune.genre, name: @tune.name }
    assert_redirected_to tune_path(assigns(:tune))
  end

  test "should destroy tune" do
    assert_difference('Tune.count', -1) do
      delete :destroy, id: @tune
    end

    assert_redirected_to tunes_path
  end
end
