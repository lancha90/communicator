require 'test_helper'

class LoginRegistersControllerTest < ActionController::TestCase
  setup do
    @login_register = login_registers(:one)
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:login_registers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create login_register" do
    assert_difference('LoginRegister.count') do
      
      post :create, login_register: { user: @login_register.user }
    end

    assert_redirected_to login_register_path(assigns(:login_register))
  end

  test "should show login_register" do
    get :show, id: @login_register
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @login_register
    assert_response :success
  end

  test "should update login_register" do
    put :update, id: @login_register, login_register: { user: @login_register.user }
    assert_redirected_to login_register_path(assigns(:login_register))
  end

  test "should destroy login_register" do
    assert_difference('LoginRegister.count', -1) do
      delete :destroy, id: @login_register
    end

    assert_redirected_to login_registers_path
  end
end
