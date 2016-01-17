require 'rails_helper'

RSpec.describe Father, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male)}
  end

  context 'associations' do 
    it { is_expected.to have_many :children }
    it { is_expected.to have_many :sons }
    it { is_expected.to have_many :daughters }
  end

  describe '#ensure_valid_age?' do
    let(:yunchang)  { build(:father) }
    context 'valid' do
      it "#{Date.today}" do
        yunchang.dob = Date.today - 25.years
        expect(yunchang).to be_valid
      end
    end

    context 'invalid' do
      dob = Date.today  + 20.years
      it "#{dob}" do
        yunchang.dob = dob
        expect(yunchang).to_not be_valid
      end
    end
  end

  describe 'function father_of' do 
    let!(:father) { create(:father, dob: Date.today - 20.years) }
    let!(:child)   { create(:child, father: father) } 
    let!(:another_child)   { create(:child) } 

    it 'father_of child -> true' do 
      expect(father.father_of?(child) ).to eq true
    end

    it 'father_of child -> false' do 
      expect(father.father_of?(another_child) ).to eq false
    end
  end

  describe 'say something' do 
    let!(:father)   { create(:father, dob: Date.today - 30.year) } 

    it 'father_of child -> true' do 
      expect( father.say_something).to eq "Hello, I am your father."
    end
  end
end
