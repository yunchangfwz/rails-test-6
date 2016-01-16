require 'rails_helper'

RSpec.describe Father, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male)}
  end

  context 'associations' do 
    it { is_expected.to have_many :children }
  end

  describe 'function father_of' do 
    let!(:father) { create(:father, first_name: 'Father', last_name: "last_name", dob: Date.today - 30.year) }
    let!(:child)   { create(:child, first_name: 'Child', last_name: "last_name", father: father, dob: Date.today - 5.year) } 
    let!(:another_child)   { create(:child, first_name: 'Child', last_name: "last_name", father: nil, dob: Date.today - 5.year) } 

    it 'father_of child -> true' do 
      expect(father.father_of?(child) ).to eq true
    end

    it 'father_of child -> false' do 
      expect(father.father_of?(another_child) ).to eq false
    end
  end
end
