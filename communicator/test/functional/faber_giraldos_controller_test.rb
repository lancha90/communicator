require 'test_helper'

class FaberGiraldosControllerTest < ActionController::TestCase
  setup do
    @faber_giraldo = faber_giraldos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faber_giraldos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faber_giraldo" do
    assert_difference('FaberGiraldo.count') do
      post :create, faber_giraldo: { edad: @faber_giraldo.edad, nombre: @faber_giraldo.nombre }
    end

    assert_redirected_to faber_giraldo_path(assigns(:faber_giraldo))
  end

  test "should show faber_giraldo" do
    get :show, id: @faber_giraldo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faber_giraldo
    assert_response :success
  end

  test "should update faber_giraldo" do
    put :update, id: @faber_giraldo, faber_giraldo: { edad: @faber_giraldo.edad, nombre: @faber_giraldo.nombre }
    assert_redirected_to faber_giraldo_path(assigns(:faber_giraldo))
  end

  test "should destroy faber_giraldo" do
    assert_difference('FaberGiraldo.count', -1) do
      delete :destroy, id: @faber_giraldo
    end

    assert_redirected_to faber_giraldos_path
  end
end
