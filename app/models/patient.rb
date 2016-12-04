class Patient < ApplicationRecord

  belongs_to :user

  validates :name, presence: true, length: 4..20

end
