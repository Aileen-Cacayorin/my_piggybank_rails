require 'rails_helper'

describe Account do

  it { should belong_to :child}
  it { should validate_presence_of :beginning_balance}
  it { should have_many :transactions }
end
