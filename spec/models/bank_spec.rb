require 'rails_helper'

describe Bank do
 it { should belong_to :parent }
 it { should have_many :children}

end
