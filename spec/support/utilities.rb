

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


def add_bank
  sign_up
  fill_in 'Name', with: "My Bank"
  click_button "Add Bank"
end

def add_child
  add_bank
  click_link "Add a child to your bank"
  fill_in "Username", with: "ExampleKid"
  fill_in "First name", with: "Example"
  fill_in "Last name", with: "Kid"
  fill_in "Password", with: "examplekid"
  fill_in "Password confirmation", with: "examplekid"
  click_button "Sign up"

end

def add_account
  add_child
  click_link "Start Account"
  fill_in "Beginning balance", with: "120.00"
  click_button "Submit"
  page.should have_no_content "Start Account"

end

def add_transaction
  add_account
  visit "/"
  click_link "My Bank (testperson)"
  click_link "View Account"
  click_link "Make a transaction"
  fill_in "Description", with: "Chores"
  choose('transaction_transaction_type_deposit')
  fill_in "Amount", with: 12.25
  click_button "Add transaction"
end


def child_login
  add_account
  click_link "Log Out"
  click_link "Child Sign In"
  fill_in "Username", with: "ExampleKid"
  fill_in "Password", with: "examplekid"
  click_button "Log in"
end
