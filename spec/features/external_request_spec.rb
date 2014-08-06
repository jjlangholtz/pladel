require 'rails_helper'

feature 'External request' do
  it 'verifies Validic credentials' do
    uri = URI("https://api.validic.com/v1/organizations/#{ENV["VALIDIC_ORGANIZATION_ID"]}.json?access_token=#{ENV["VALIDIC_ACCESS_TOKEN"]}")

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
