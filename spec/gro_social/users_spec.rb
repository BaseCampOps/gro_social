require 'spec_helper'

RSpec.describe GroSocial::Users do
  before(:each) do
    GroSocial::Client.test_mode = true
    GroSocial::Client.api_key = ENV['GROSOCIAL_KEY']
    GroSocial::Client.api_password = ENV['GROSOCIAL_PASSWORD']
  end

  describe '.[]' do
    it 'responds' do
      expect(GroSocial::Users).to respond_to(:[])
    end

    it 'returns a GroSocial::User when one exists', :vcr do
      expect(GroSocial::Users['20183']).to be_a_kind_of(GroSocial::User)
    end

    it 'returns nil when a User does not exist', :vcr do
      expect(GroSocial::Users['0']).to eq(nil)
    end
  end

  describe '.<<' do
    it 'responds' do
      expect(GroSocial::Users).to respond_to(:<<)
    end

    context 'with a fresh user' do
      vcr_options = { cassette_name: 'GroSocial_Users/creating_a_user' }
      
      let(:user) do
        GroSocial::User.new(firstname:  'John',
                            lastname:   'Doe',
                            email:      'johndoe@example.org',
                            password:   'secret123',
                            phone:      '(555) 123-4567')
      end

      it 'accepts and returns a GroSocial::User', vcr: vcr_options do
        expect(GroSocial::Users << user).to be_a(GroSocial::User)
      end

      it 'updates the :id field', vcr: vcr_options do
        expect(user.id).to be_nil
        GroSocial::Users << user
        expect(user.id).to_not be_nil
      end
    end
  end

  # describe '.each' do
  #   it 'responds' do
  #     expect(GroSocial::Users).to respond_to(:each)
  #   end
  #
  #   it 'returns GroSocial::User instances' do
  #     # GroSocial::Users.each do |user|
  #     #   expect(user).to be_a_kind_of(GroSocial::User)
  #     # end
  #   end
  # end
end