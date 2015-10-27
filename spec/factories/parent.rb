FactoryGirl.define do
  factory :parent do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    password_confirmation 'f4k3p455w0rd'
    username 'fakeuser'
    first_name "fake"
    last_name "user"
  end
end
