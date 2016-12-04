require 'rails_helper'

RSpec.describe Ability, type: :model do
  subject(:ability) { Ability.new(user) }

  describe 'for guest' do
    let(:user) { nil }

    it { should_not be_able_to :manage, Patient }
    it { should_not be_able_to :manage, :all }
    it { should_not be_able_to :read, Patient }
    it { should be_able_to :read, :home }
  end

  describe 'for user' do
    include_context 'users'

    let(:user_patient) { create(:patient, user: user) }
    let(:john_patient) { create(:patient, user: john) }

    it { should be_able_to :create, Patient }

    context 'show' do
      it { should be_able_to :show, user_patient }
      it { should_not be_able_to :show, john_patient }
    end

    context 'update' do
      it { should be_able_to :update, user_patient }
      it { should_not be_able_to :update, john_patient }
    end

    context 'destroy' do
      it { should be_able_to :destroy, user_patient }
      it { should_not be_able_to :destroy, john_patient }
    end

    # context 'set_default' do
    #   it { should be_able_to :set_default, create(:patient, user: user) }
    # end

    # context 'destroy attachments' do
    #   it { should be_able_to :destroy, user_patient.attachments.build }
    #   it { should_not be_able_to :destroy, john_patient.attachments.build }
    # end
  end
end
