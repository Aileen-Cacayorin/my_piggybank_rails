require 'rails_helper'

describe Chore do
  it { should validate_presence_of :description }
  it { should validate_presence_of :pay }
  it { should belong_to :bank }
  it { should belong_to :child }
end
