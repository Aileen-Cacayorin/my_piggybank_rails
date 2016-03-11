require 'rails_helper'

describe "the add transaction path", js: true do
  it 'creates a transaction' do
    add_account

  sleep 2

    click_on "View Account"
    sleep 6

    click_link "new_transaction_link"
    fill_in "Description", with: "Chores"
    choose('transaction_transaction_type_deposit')
    fill_in "Amount", with: 12.25
    click_button "Add transaction"
    expect(page).to have_content("Chores")
  end
end
