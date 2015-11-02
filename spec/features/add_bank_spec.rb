
require 'rails_helper'

describe "the add a bank process" do
  it 'adds a bank to a parent' do
    sign_up
    fill_in 'Name', with: "My Bank"
    click_button "Add Bank"
    expect(page).to have_content "My Bank"
  end
end


def sign_up
  visit "/"
  click_link "Parent Sign up"
  fill_in "Email", with: "testperson@gmail.com"
  fill_in "Username", with: "testperson"
  fill_in "First name", with: "test"
  fill_in "Last name", with: "person"
  fill_in "Password", with: "testperson"
  fill_in "Password confirmation", with: "testperson"
  click_button "Sign up"
end
