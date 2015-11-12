require 'rails_helper'

describe "the add request path", js: true do
  it 'creates a transaction request' do
    child_login
    click_link "Save Money"
    fill_in "What is this money for?", with: "Birthday Money"
    fill_in "Amount", with: 50.00
    click_button "Request transaction"
    expect(page).to have_content("Birthday Money")


  end
end
