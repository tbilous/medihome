require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:patients) }
  it { should validate_presence_of :name }

  describe '#owner?' do
    include_context 'users'

    let(:patient)   { create(:patient, user: user) }

    context "when user is the patient's owner" do
      it { expect(user).to be_owner_of(patient) }
    end

    context "when user is not the patient's owner" do
      it { expect(john).to_not be_owner_of(patient) }
    end
  end
end
