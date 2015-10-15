require 'rails_helper'

describe Child do
  it { should belong_to :bank }
end
