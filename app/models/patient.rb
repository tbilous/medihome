class Patient < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: 4..30
  validates :birth, presence: true
  validates :usd, uniqueness: { scope: :user_id }, if: :usd?

  default_scope { order('usd DESC, created_at DESC') }

  def set_usd
    transaction do
      user.patients.where(usd: true).each do |patient|
        patient.update!(usd: false)
      end
      update!(usd: true)
    end
  end
end
