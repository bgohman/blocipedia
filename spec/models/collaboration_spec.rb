require 'rails_helper'

RSpec.describe Collaboration, type: :model do
  describe 'relationships' do
  	it { should belong_to(:user) }
  	it { should belong_to(:wiki) }
  end

end