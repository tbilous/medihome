require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:patients) }
  it { should validate_presence_of :name }
  it { should have_many(:patients).dependent(:destroy) }

  include_context 'users'
  describe '#owner?' do

    let(:patient)   { create(:patient, user: user) }

    context "when user is the patient's owner" do
      it { expect(user).to be_owner_of(patient) }
    end

    context "when user is not the patient's owner" do
      it { expect(john).to_not be_owner_of(patient) }
    end


  end
  describe 'depend destroy' do
    let!(:patient) { create(:patient, user: user)}
    it { expect { user.destroy }.to change { Patient.count } }
  end
end
