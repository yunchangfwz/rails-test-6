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
    let!(:mother) { create(:mother, first_name: 'Mother', last_name: "last_name", dob: Date.today - 20.year) }
    let!(:child)   { create(:child, first_name: 'Child', last_name: "last_name", mother: mother, dob: Date.today - 5.year) } 
    let!(:another_child)   { create(:child, first_name: 'Child', last_name: "last_name", father: nil, dob: Date.today - 5.year) } 

    it 'mother_of child -> true' do 
      expect(mother.mother_of?(child) ).to eq true
    end

    it 'mother_of child -> false' do 
      expect(mother.mother_of?(another_child) ).to eq false
    end
  end
end
