
require 'rails_helper'

describe "the add a bank process" do
  it 'adds a bank to a parent' do
    visit '/'
    click_link "Parent Sign In"
    parent = FactoryGirl.create(:parent)
    login_as(parent, :scope => :parent)
    save_and_open_page
    fill_in 'Name', with: "My Bank"
    click_button "Add Bank"
    expect(page).to have_content "My Bank"
  end
end
