require 'rails_helper'

describe "the add a child process" do
  it 'adds a child to a bank' do
    add_bank
    click_link "Add a child to your bank"
    fill_in "Username", with: "ExampleKid"
    fill_in "First name", with: "Example"
    fill_in "Last name", with: "Kid"
    fill_in "Password", with: "examplekid"
    fill_in "Password confirmation", with: "examplekid"
    click_button "Sign up"
    expect(page).to have_content "examplekid"
  end
end
