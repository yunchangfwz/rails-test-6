require 'rails_helper'

RSpec.describe Mother, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:female)}
  end

  context 'associations' do 
    it { is_expected.to have_many :children }
    it { is_expected.to have_many :sons }
    it { is_expected.to have_many :daughters }
  end

  describe 'function mother_of' do 
    let(:yunchang) { create(:father) }
    let(:lyly)     { create(:mother) }
    let(:suka)     { create(:mother) }
    let(:tintin)   { create(:child, mother: suka, father: yunchang, dob: Date.today - 5.year) } 
    let(:tantan)   { create(:child, mother: lyly, father: yunchang, dob: Date.today - 5.year) } 

    it 'mother_of child -> true' do 
      expect(suka.mother_of?(tintin) ).to eq true
    end

    it 'mother_of child -> false' do 
      expect(suka.mother_of?(tantan) ).to eq false
    end
  end
end
