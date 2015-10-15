require 'rails_helper'

describe Parent do
  it { should have_one :bank }
end
