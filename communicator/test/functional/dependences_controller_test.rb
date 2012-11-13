require 'test_helper'

class DependencesControllerTest < ActionController::TestCase
  setup do
    @dependence = dependences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dependences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dependence" do
    assert_difference('Dependence.count') do
      post :create, dependence: { information: @dependence.information, mision: @dependence.mision, name: @dependence.name, vision: @dependence.vision }
    end

    assert_redirected_to dependence_path(assigns(:dependence))
  end

  test "should show dependence" do
    get :show, id: @dependence
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dependence
    assert_response :success
  end

  test "should update dependence" do
    put :update, id: @dependence, dependence: { information: @dependence.information, mision: @dependence.mision, name: @dependence.name, vision: @dependence.vision }
    assert_redirected_to dependence_path(assigns(:dependence))
  end

  test "should destroy dependence" do
    assert_difference('Dependence.count', -1) do
      delete :destroy, id: @dependence
    end

    assert_redirected_to dependences_path
  end
end
