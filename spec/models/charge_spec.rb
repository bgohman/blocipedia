require 'rails_helper'

RSpec.describe Charge, type: :model do
  describe 'relationships' do
  	it { should belong_to(:user) }
  end

end