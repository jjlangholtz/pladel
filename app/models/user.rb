class User < ActiveRecord::Base
  after_create :generate_pid
  after_create :provision_for_validic

  include Clearance::User

  has_many :sleep_sessions
  has_and_belongs_to_many :foods

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

  def sleep_composite
    sleep_scores = sleep_sessions.map { |s| s.score }
    sleep_scores.inject(0.0) { |sum, el| sum + el } / sleep_sessions.size
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
