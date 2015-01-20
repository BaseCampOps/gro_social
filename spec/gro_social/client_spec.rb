require 'spec_helper'
require 'vcr_helper'

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

    context 'with invalid credentials' do
      before(:each) do
        GroSocial::Client.test_mode = true
      end

      it 'raises an error' do
        expect {
          GroSocial::Client.request('Users', :get)
        }.to raise_error(RuntimeError, 'GroSocial credentials not accepted')
      end
    end

    context 'with options to GET all Users' do
      before(:each) do
        GroSocial::Client.test_mode = true
        GroSocial::Client.api_key = ENV['GROSOCIAL_KEY']
        GroSocial::Client.api_password = ENV['GROSOCIAL_PASSWORD']
      end

      it 'does not raise an error' do
        expect {
          GroSocial::Client.request('Users', :get)
        }.to_not raise_error
      end

      it 'returns a parsed JSON response' do
        result = GroSocial::Client.request('Users', :get)
        expect(result).to be_a(Hash)
        expect(result['result']).to_not be_nil
        expect(result['result']['users']).to_not be_nil
      end
    end
  end

  describe '.api_url' do
    it 'responds' do
      expect(GroSocial::Client).to respond_to(:api_url)
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

    context 'when set to true' do
      before(:each) do
        GroSocial::Client.test_mode = true
      end

      it 'causes .api_url to return \'https://apidev.grosocial.com\'' do
        expect(GroSocial::Client.api_url).to eq('https://apidev.grosocial.com')
      end
    end

    context 'when set to false' do
      before(:each) do
        GroSocial::Client.test_mode = false
      end

      it 'causes .api_url to return \'https://api.grosocial.com\'' do
        expect(GroSocial::Client.api_url).to eq('https://api.grosocial.com')
      end
    end
  end
end