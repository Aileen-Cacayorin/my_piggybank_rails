
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


test_parent = Parent.create(
  username: "username",
  email: "username@gmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "user",
  last_name: "name"
)

test_bank = Bank.create(
  name: "Test Bank",
  parent_id: "#{test_parent.id}"

)

test_child = Child.create(
  username: "testchild",
  password: "fakefake",
  password_confirmation: "fakefake",
  first_name: "test",
  last_name: "child",
  bank_id: "#{test_bank.id}"
)

test_account = Account.create(
  beginning_balance: 100.00,
  child_id: "#{test_child.id}"
)

10.times do |n|
  n = Transaction.create(
    description: %w[j k i e r e z n a x y q u o p z y e].sample(10).join(""),
    transaction_type: "Deposit",
    amount: 5.25,
    account_id: "#{test_account.id}"
  )
  n.created_at = (rand * 30).day.ago.to_time
  n.save
end

6.times do |n|
  Transaction.create(
    description: %w[j k i e r e z n a x y q u o p z y e].sample(10).join(""),
    transaction_type: "Withdrawal",
    amount: 5.25,
    account_id: "#{test_account.id}"
  )
end
