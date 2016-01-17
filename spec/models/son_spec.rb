require 'rails_helper'

RSpec.describe Son, type: :model do
  context 'associations' do 
    it { is_expected.to  belong_to :father}
    it { is_expected.to  belong_to :mother}
  end

  describe 'say something' do 
    let!(:david)   { create(:son) } 

    it 'say_something' do 
      expect( david.say_something).to eq "Hello, I am your son."
    end
  end
end
