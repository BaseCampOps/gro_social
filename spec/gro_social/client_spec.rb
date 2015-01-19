require 'spec_helper'

RSpec.describe GroSocial::Client do
  before(:each) { Singleton.__init__(GroSocial::Client) }

  describe '.api_key' do
    it 'responds' do
      expect(GroSocial::Client).to respond_to(:api_key)
    end
  end

  describe '.api_key=' do
    it 'responds' do
      expect(GroSocial::Client).to respond_to(:api_key=)
    end

    it 'sets api_key value' do
      GroSocial::Client.api_key = 'secret'
      expect(GroSocial::Client.api_key).to eq('secret')
    end
  end

  describe '.api_password' do
    it 'responds' do
      expect(GroSocial::Client).to respond_to(:api_password)
    end
  end

  describe '.api_password=' do
    it 'responds' do
      expect(GroSocial::Client).to respond_to(:api_password=)
    end

    it 'sets api_password value' do
      GroSocial::Client.api_password = 'secret'
      expect(GroSocial::Client.api_password).to eq('secret')
    end
  end

  describe '.request' do
    it 'responds' do
      expect(GroSocial::Client).to respond_to(:request)
    end
  end

  describe '.test_mode=' do
    it 'responds' do
      expect(GroSocial::Client).to respond_to(:test_mode=)
    end

    it 'sets test_mode value' do
      GroSocial::Client.test_mode = true
      expect(GroSocial::Client.test_mode).to be_truthy
    end
  end

  describe '.test_mode' do
    it 'responds' do
      expect(GroSocial::Client).to respond_to(:test_mode)
    end

    it 'defaults to false' do
      expect(GroSocial::Client.test_mode).to be_falsey
    end
  end
end