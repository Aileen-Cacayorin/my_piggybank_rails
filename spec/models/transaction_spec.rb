require 'rails_helper'

describe Transaction do
  it { should belong_to :account }
  it { should validate_presence_of :amount }
  it { should validate_presence_of :transaction_type }
  it { should validate_presence_of :description }
end
