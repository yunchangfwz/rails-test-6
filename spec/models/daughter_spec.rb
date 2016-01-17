require 'rails_helper'

RSpec.describe Daughter, type: :model do
  context 'associations' do 
    it { is_expected.to  belong_to :father}
    it { is_expected.to  belong_to :mother}
  end

  describe 'say something' do 
    let!(:yunchang) { create(:father) } 
    let!(:suka)     { create(:mother) } 
    let!(:lyly)     { create(:daughter, father: yunchang, mother: suka) } 

    it 'father_of child -> true' do 
      expect( lyly.say_something).to eq "Hello, I'm your daughter"
    end
  end
end
