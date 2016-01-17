require 'rails_helper'

RSpec.describe Child, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male, :female)}
  end

  context 'associations' do 
    it { is_expected.to  belong_to :father}
    it { is_expected.to  belong_to :mother}
  end

  describe 'say something' do 
    let!(:child)   { create(:child) } 

    it 'father_of child -> true' do 
      expect( child.say_something).to eq "Hello, I'm is a child"
    end
  end

  describe '#age_smaller_than_parent?' do
    let(:yunchang)  { create(:father, dob: Date.today  - 20.years) }
    let(:james)     { create(:father, dob: Date.today  - 40.years) }
    let(:david)     { build(:child, father_id: yunchang.id) }
    let(:lyly)      { build(:child, father_id: james.id) }
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
