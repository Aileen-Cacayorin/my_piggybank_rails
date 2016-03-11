require 'rails_helper'

describe Parent do
  it { should have_one :bank }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :username }
  it { should have_many :requests}
  it { should have_many :chores}
end
