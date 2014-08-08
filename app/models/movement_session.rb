class MovementSession < ActiveRecord::Base
  belongs_to :user

  validates :timestamp, uniqueness: true
end
