require 'rails_helper'

describe Bank do
 it { should belong_to :parent }
 it { should have_many :children}
 it { should validate_presence_of :name }
 it { should have_many :transactions}
end
