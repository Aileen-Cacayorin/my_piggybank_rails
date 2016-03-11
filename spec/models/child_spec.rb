require 'rails_helper'

describe Child do
  it { should belong_to :bank }
  it { should have_one :account}
  it { should have_many :requests}
  it { should have_many :chores}
end
