require "application_system_test_case"

class ToDoItemsTest < ApplicationSystemTestCase
  setup do
    @to_do_item = to_do_items(:one)
  end

  test "visiting the index" do
    visit to_do_items_url
    assert_selector "h1", text: "To do items"
  end

  test "should create to do item" do
    visit to_do_items_url
    click_on "New to do item"

    fill_in "Description", with: @to_do_item.description
    fill_in "Todolist", with: @to_do_item.todolist_id
    click_on "Create To do item"

    assert_text "To do item was successfully created"
    click_on "Back"
  end

  test "should update To do item" do
    visit to_do_item_url(@to_do_item)
    click_on "Edit this to do item", match: :first

    fill_in "Description", with: @to_do_item.description
    fill_in "Todolist", with: @to_do_item.todolist_id
    click_on "Update To do item"

    assert_text "To do item was successfully updated"
    click_on "Back"
  end

  test "should destroy To do item" do
    visit to_do_item_url(@to_do_item)
    click_on "Destroy this to do item", match: :first

    assert_text "To do item was successfully destroyed"
  end
end
