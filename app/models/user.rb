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

  def time_zone
    unless @time_zone
      tz_id = read_attribute(:time_zone)
      as_name = ActiveSupport::TimeZone::MAPPING.select do |_,v|
        v == tz_id
      end.sort_by do |k,v|
        v.ends_with?(k) ? 0 : 1
      end.first.try(:first)
      value = as_name || tz_id
      @time_zone = value && ActiveSupport::TimeZone[value]
    end
    @time_zone
  end

end
