require "application_system_test_case"

class ScheduleItemsTest < ApplicationSystemTestCase
  setup do
    @schedule_item = schedule_items(:one)
  end

  test "visiting the index" do
    visit schedule_items_url
    assert_selector "h1", text: "Schedule items"
  end

  test "should create schedule item" do
    visit schedule_items_url
    click_on "New schedule item"

    fill_in "Notes", with: @schedule_item.notes
    fill_in "Start time", with: @schedule_item.start_time
    fill_in "Title", with: @schedule_item.title
    click_on "Create Schedule item"

    assert_text "Schedule item was successfully created"
    click_on "Back"
  end

  test "should update Schedule item" do
    visit schedule_item_url(@schedule_item)
    click_on "Edit this schedule item", match: :first

    fill_in "Notes", with: @schedule_item.notes
    fill_in "Start time", with: @schedule_item.start_time.to_s
    fill_in "Title", with: @schedule_item.title
    click_on "Update Schedule item"

    assert_text "Schedule item was successfully updated"
    click_on "Back"
  end

  test "should destroy Schedule item" do
    visit schedule_item_url(@schedule_item)
    click_on "Destroy this schedule item", match: :first

    assert_text "Schedule item was successfully destroyed"
  end
end
