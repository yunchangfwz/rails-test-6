require 'rails_helper'

RSpec.describe Mother, type: :model do
  context 'associations' do 
    it { is_expected.to have_many :childs }
  end
end
