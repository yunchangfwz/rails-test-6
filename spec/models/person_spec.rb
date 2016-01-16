require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to enumerize(:gender).in(:male, :female)}
  end

  describe '#ensure_valid_age?' do
    let(:person)  { build(:person) }
    context 'valid' do
      it "#{Date.today}" do
        person.dob = Date.today + 1.days
        expect(person).to be_valid
      end
    end

    context 'invalid' do
      dob = Date.today  - 1.days
      it "#{dob}" do
        person.dob = dob
        expect(person).to_not be_valid
      end
    end
  end
end
