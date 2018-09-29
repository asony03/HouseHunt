require 'test_helper'

class HousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get houses_url
    assert_response :success
  end

  test "should get new" do
    get new_house_url
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post houses_url, params: { house: { basement: @house.basement, contact: @house.contact, floors: @house.floors, house_style: @house.house_style, location: @house.location, owner: @house.owner, potential_buyers: @house.potential_buyers, price: @house.price, real_estate_company: @house.real_estate_company, sq_ft: @house.sq_ft, user: @house.user, year: @house.year } }
    end

    assert_redirected_to house_url(House.last)
  end

  test "should show house" do
    get house_url(@house)
    assert_response :success
  end

  test "should get edit" do
    get edit_house_url(@house)
    assert_response :success
  end

  test "should update house" do
    patch house_url(@house), params: { house: { basement: @house.basement, contact: @house.contact, floors: @house.floors, house_style: @house.house_style, location: @house.location, owner: @house.owner, potential_buyers: @house.potential_buyers, price: @house.price, real_estate_company: @house.real_estate_company, sq_ft: @house.sq_ft, user: @house.user, year: @house.year } }
    assert_redirected_to house_url(@house)
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete house_url(@house)
    end

    assert_redirected_to houses_url
  end
end
