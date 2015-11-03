require 'rails_helper'

describe "the add account path" do
  it 'creates a child account' do
    add_child
    click_link "Start Account"
    fill_in "Beginning balance", with: "120.00"
    click_button "Submit"
    expect(page).should not_have_content "Start Account"
  end
end
