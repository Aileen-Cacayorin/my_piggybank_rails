require 'rails_helper'

describe "the add transaction path", js: true do
  it 'creates a transaction' do
    add_account
    visit "/"
    click_link "Logged in as testperson"
    click_link "View Account"
    click_link "Make a transaction"
    fill_in "Description", with: "Chores"
    choose('transaction_transaction_type_deposit')
    fill_in "Amount", with: 12.25
    click_button "Add transaction"
    expect(page).to have_content("Chores")
  end
end
