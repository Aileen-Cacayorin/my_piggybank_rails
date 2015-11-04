require 'rails_helper'

describe Request do
  it { should belong_to :parent }
  it { should belong_to :child }
  it { should validate_presence_of :amount }
  it { should validate_presence_of :request_type }
  it { should validate_presence_of :description }
end
