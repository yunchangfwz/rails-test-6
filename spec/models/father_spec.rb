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
    let(:david)    { create(:father) }
    let(:yunchang) { create(:father, dob: Date.today - 20.years) }
    let(:suka)     { create(:mother) }
    let(:tintin)   { create(:child, father: yunchang, mother: suka) } 
    let(:tantan)   { create(:child, father: david,    mother: suka) } 

    it 'father_of child -> true' do 
      expect(yunchang.father_of?(tintin) ).to eq true
    end

    it 'father_of child -> false' do 
      expect(yunchang.father_of?(tantan) ).to eq false
    end
  end

  describe 'say something' do 
    let(:yunchang)   { create(:father, dob: Date.today - 30.year) } 

    it 'father_of child -> true' do 
      expect( yunchang.say_something).to eq "Hello, I am your father."
    end
  end
end
