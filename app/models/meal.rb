class Meal < ActiveRecord::Base
  belongs_to :user

  def self.today(user)
    where('updated_at >= ? AND updated_at < ? AND user_id = ?',
          Time.now.midnight, (Time.now + 1.day).midnight, user.id)
  end
end
