require 'rails_helper'

describe Allowance do
  it { should belong_to :account}
  it { should validate_presence_of :amount}
end
