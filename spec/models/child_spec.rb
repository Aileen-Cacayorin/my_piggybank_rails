require 'rails_helper'

describe Child do
  it { should belong_to :bank }
  it { should have_one :account}
end
