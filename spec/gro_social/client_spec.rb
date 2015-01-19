require 'spec_helper'

RSpec.describe GroSocial::Client do
  it 'responds to .api_key=' do
    expect(GroSocial::Client).to respond_to(:api_key=)
  end

  it 'responds to .api_key' do
    expect(GroSocial::Client).to respond_to(:api_key)
  end

  it 'responds to .api_password=' do
    expect(GroSocial::Client).to respond_to(:api_password=)
  end

  it 'responds to .api_password' do
    expect(GroSocial::Client).to respond_to(:api_password)
  end

  describe '.api_key=' do
    it 'sets api_key value' do
      GroSocial::Client.api_key = 'secret'
      expect(GroSocial::Client.api_key).to eq('secret')
    end
  end

  describe '.api_password=' do
    it 'sets api_password value' do
      GroSocial::Client.api_password = 'secret'
      expect(GroSocial::Client.api_password).to eq('secret')
    end
  end
end