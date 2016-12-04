class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :patients, dependent: :destroy

  validates :name, presence: true, length: 4..20

  def owner_of?(resource)
    resource.user_id == id
  end
end
