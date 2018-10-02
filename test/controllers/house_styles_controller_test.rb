require 'test_helper'

class HouseStylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house_style = house_styles(:one)
  end

  test "should get index" do
    get house_styles_url
    assert_response :success
  end

  test "should get new" do
    get new_house_style_url
    assert_response :success
  end

  test "should create house_style" do
    assert_difference('HouseStyle.count') do
      post house_styles_url, params: { house_style: { name: @house_style.name } }
    end

    assert_redirected_to house_style_url(HouseStyle.last)
  end

  test "should show house_style" do
    get house_style_url(@house_style)
    assert_response :success
  end

  test "should get edit" do
    get edit_house_style_url(@house_style)
    assert_response :success
  end

  test "should update house_style" do
    patch house_style_url(@house_style), params: { house_style: { name: @house_style.name } }
    assert_redirected_to house_style_url(@house_style)
  end

  test "should destroy house_style" do
    assert_difference('HouseStyle.count', -1) do
      delete house_style_url(@house_style)
    end

    assert_redirected_to house_styles_url
  end
end
