class User < ActiveRecord::Base
  after_create :provision_for_validic

  include Clearance::User

  has_and_belongs_to_many :foods

  def provision_for_validic
    client = Validic::Client.new
    result = client.user_provision(organization_id: client.organization_id,
                          access_token: client.access_token,
                          uid: User.last.id.to_s)
    self.uid = result["user"]["_id"]
    self.token = result["user"]["access_token"]
    save!
  end
end
