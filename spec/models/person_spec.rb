require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :gender}
  end

  describe '#ensure_valid_age?' do
    let(:yunchang)  { build(:person) }
    context 'valid' do
      it "#{Date.today}" do
        yunchang.dob = Date.today - 2.years
        expect(yunchang).to be_valid
      end
    end

    context 'invalid' do
      dob = Date.today  + 2.years
      it "#{dob}" do
        yunchang.dob = dob
        expect(yunchang).to_not be_valid
      end
    end
  end

  describe 'Older than' do
    let(:yunchang)  { build(:person) }
    let(:james)     { build(:person, dob: Date.today - 2.years ) }
    let(:robin)     { build(:person, dob: Date.today - 3.years ) }
    let(:oliver)    { build(:person, dob: Date.today - 1.years ) }
    context 'Age' do
      it "Yunchang have the same age with James" do
        expect(yunchang.older_than(james)).to eq 0
      end
      it "Yunchang is stronger than Robin" do
        expect(yunchang.older_than(robin)).to eq -1
      end
      it "Yunchang is older than Oliver" do
        expect(yunchang.older_than(oliver)).to eq 1
      end
    end
  end
end
