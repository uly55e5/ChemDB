require 'test_helper'

class ChemicalNamesControllerTest < ActionController::TestCase
  setup do
    @chemical_name = chemical_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chemical_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chemical_name" do
    assert_difference('ChemicalName.count') do
      post :create, :chemical_name => @chemical_name.attributes
    end

    assert_redirected_to chemical_name_path(assigns(:chemical_name))
  end

  test "should show chemical_name" do
    get :show, :id => @chemical_name.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @chemical_name.to_param
    assert_response :success
  end

  test "should update chemical_name" do
    put :update, :id => @chemical_name.to_param, :chemical_name => @chemical_name.attributes
    assert_redirected_to chemical_name_path(assigns(:chemical_name))
  end

  test "should destroy chemical_name" do
    assert_difference('ChemicalName.count', -1) do
      delete :destroy, :id => @chemical_name.to_param
    end

    assert_redirected_to chemical_names_path
  end
end
