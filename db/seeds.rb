# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


test_parent = Parent.create(
  username: "janedoe",
  email: "janedoe@gmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Jane",
  last_name: "Doe"
)

test_bank = Bank.create(
  name: "Bank of Doe",
  parent_id: "#{test_parent.id}"

)

test_child = Child.create(
  username: "averydoe",
  password: "averydoe",
  password_confirmation: "averydoe",
  first_name: "Avery",
  last_name: "Doe",
  bank_id: "#{test_bank.id}"
)

test_account = Account.create(
  beginning_balance: 100.00,
  child_id: "#{test_child.id}"
)

fake_child = Child.create(
  username: "thomasdoe",
  password: "thomasdoe",
  password_confirmation: "thomasdoe",
  first_name: "Thomas",
  last_name: "Doe",
  bank_id: "#{test_bank.id}"
)

fake_account = Account.create(
  beginning_balance: 50.00,
  child_id: "#{fake_child.id}"
)

10.times do |n|
  n = Transaction.create(
    description: %w[j k i e r e z n a x y q u o p z y e].sample(10).join(""),
    transaction_type: "Deposit",
    amount: (rand * 30),
    account_id: "#{test_account.id}",
    bank_id: "#{test_bank.id}"
  )

  n.created_at = (rand * 30).day.ago.to_time
  n.save

end

6.times do |n|
  n = Transaction.create(
    description: %w[j k i e r e z n a x y q u o p z y e].sample(10).join(""),
    transaction_type: "Withdrawal",
    amount: -(rand * 30),
    account_id: "#{test_account.id}",
    bank_id: "#{test_bank.id}"
  )
  n.created_at = (rand*30).days.ago.to_time
  n.save
end

10.times do |n|
  n = Transaction.create(
    description: %w[j k i e r e z n a x y q u o p z y e].sample(10).join(""),
    transaction_type: "Deposit",
    amount: (rand * 30),
    account_id: "#{fake_account.id}",
    bank_id: "#{test_bank.id}"
  )

  n.created_at = (rand * 30).day.ago.to_time
  n.save

end

6.times do |n|
  n = Transaction.create(
    description: %w[j k i e r e z n a x y q u o p z y e].sample(10).join(""),
    transaction_type: "Withdrawal",
    amount: -(rand * 50),
    account_id: "#{fake_account.id}",
    bank_id: "#{test_bank.id}"
  )
  n.created_at = (rand*30).days.ago.to_time
  n.save
end
