require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :birth }
  it { should validate_presence_of :sex }

  describe 'set_default' do
    include_context 'users'

    let(:patient)  { create(:patient, user: user) }
    let!(:other_patient) { create(:patient, user: user) }

    context 'when the best answer is not defined' do
      before do
        patient.update(usd: true)
      end

      it { expect(patient).to be_usd }
    end

    context 'when the default patient is already defined' do
      before do
        patient.set_usd
        other_patient.set_usd
        patient.reload
      end

      it { should validate_uniqueness_of(:usd).scoped_to(:user_id) }
      it { expect(other_patient).to be_usd }
      it { expect(patient).to_not be_usd }
    end
  end
end
