class User < ActiveRecord::Base
  after_create :generate_pid
  after_create :provision_for_validic

  include Clearance::User

  has_many :meals
  has_many :movement_sessions
  has_many :sleep_sessions
  has_and_belongs_to_many :foods

  def health_gpa
    case
    when health_composite >= 3.3
      'A'
    when health_composite >= 2.7 && health_composite < 3.3
      'B'
    when health_composite >= 2.0 && health_composite < 2.7
      'C'
    when health_composite >= 1.0 && health_composite < 2.0
      'D'
    else
      'F'
    end
  end

  def nutrition_score
    case
    when nutrition_composite >= 0.8
      'A'
    when nutrition_composite >= 0.7 && nutrition_composite < 0.8
      'B'
    when nutrition_composite >= 0.6 && nutrition_composite < 0.7
      'C'
    when nutrition_composite >= 0.5 && nutrition_composite < 0.6
      'D'
    else
      'F'
    end
  end

  def sleep_score
    case
    when sleep_composite >= 30
      'A'
    when sleep_composite >= 18 && sleep_composite < 30
      'B'
    when sleep_composite >= 10 && sleep_composite < 18
      'C'
    when sleep_composite >= 4 && sleep_composite < 10
      'D'
    else
      'F'
    end
  end

  def movement_score
    case
    when movement_composite >= 5000
      'A'
    when movement_composite >= 3000 && movement_composite < 5000
      'B'
    when movement_composite >= 1500 && movement_composite < 3000
      'C'
    when movement_composite >= 800 && movement_composite < 1500
      'D'
    else
      'F'
    end
  end

  def health_composite
    nutrition = nutrition_score_to_gpa
    sleep = sleep_score_to_gpa
    movement = movement_score_to_gpa
    (nutrition + sleep + movement) / 3
  end

  def nutrition_score_to_gpa
    case nutrition_score
    when 'A'
      4.0
    when 'B'
      3.0
    when 'C'
      2.0
    when 'D'
      1.0
    when 'F'
      0.0
    end
  end

  def sleep_score_to_gpa
    case sleep_score
    when 'A'
      4.0
    when 'B'
      3.0
    when 'C'
      2.0
    when 'D'
      1.0
    when 'F'
      0.0
    end
  end

  def movement_score_to_gpa
    case movement_score
    when 'A'
      4.0
    when 'B'
      3.0
    when 'C'
      2.0
    when 'D'
      1.0
    when 'F'
      0.0
    end
  end

  def nutrition_composite
    complete_meals.to_f / total_meals.to_f
  end

  def sleep_composite
    sleep_scores = sleep_sessions.map { |s| s.score }
    sleep_scores.inject(0.0) { |sum, el| sum + el } / sleep_sessions.size
  end

  def movement_composite
    movement_scores = movement_sessions.map { |s| s.score }
    movement_scores.inject(0.0) { |sum, el| sum + el } / movement_sessions.size
  end

  def total_meals
    Meal.where(status: ['complete', 'incomplete'], user: self.id).count
  end

  def complete_meals
    Meal.where(status: 'complete', user: self.id).count
  end

  private

  def generate_pid
    token = SecureRandom.urlsafe_base64
    self.pid = token
    save!
  end

  def provision_for_validic
    client = Validic::Client.new
    result = client.user_provision(organization_id: client.organization_id,
                          access_token: client.access_token,
                          uid: User.last.pid.to_s)
    self.uid = result["user"]["_id"]
    self.token = result["user"]["access_token"]
    save!
  end
end
