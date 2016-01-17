require 'rails_helper'

RSpec.describe Child, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :father_id }
    it { is_expected.to validate_presence_of :mother_id }
    it { is_expected.to enumerize(:gender).in(:male, :female)}
  end

  context 'associations' do 
    it { is_expected.to  belong_to :father}
    it { is_expected.to  belong_to :mother}
  end

  describe 'say something' do 
    let!(:father)  { create(:father) } 
    let!(:mother)  { create(:mother) } 
    let!(:child)   { create(:child, father: father, mother: mother) } 

    it 'father_of child -> true' do 
      expect( child.say_something).to eq "Hello, I'm is a child"
    end
  end

  describe '#age_smaller_than_parent?' do
    let(:suka)      { create(:mother, dob: Date.today  - 20.years) }
    let(:yunchang)  { create(:father, dob: Date.today  - 20.years) }
    let(:james)     { create(:father, dob: Date.today  - 40.years) }
    let(:david)     { build(:child, father: yunchang, mother: suka ) }
    let(:lyly)      { build(:child, father: james) }
    context 'valid' do
      it "Have valid" do
        expect(david).to be_valid
      end
    end

    context 'invalid' do
      it "Have not valid" do
        expect(lyly).to_not be_valid
      end
    end
  end
end
