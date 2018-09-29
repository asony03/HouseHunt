require "application_system_test_case"

class HouseStylesTest < ApplicationSystemTestCase
  setup do
    @house_style = house_styles(:one)
  end

  test "visiting the index" do
    visit house_styles_url
    assert_selector "h1", text: "House Styles"
  end

  test "creating a House style" do
    visit house_styles_url
    click_on "New House Style"

    fill_in "Name", with: @house_style.name
    click_on "Create House style"

    assert_text "House style was successfully created"
    click_on "Back"
  end

  test "updating a House style" do
    visit house_styles_url
    click_on "Edit", match: :first

    fill_in "Name", with: @house_style.name
    click_on "Update House style"

    assert_text "House style was successfully updated"
    click_on "Back"
  end

  test "destroying a House style" do
    visit house_styles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "House style was successfully destroyed"
  end
end
