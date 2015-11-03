
require 'rails_helper'

describe "the add a bank process" do
  it 'adds a bank to a parent' do
    sign_up
    fill_in 'Name', with: "My Bank"
    click_button "Add Bank"
    expect(page).to have_content "My Bank"
  end
end
