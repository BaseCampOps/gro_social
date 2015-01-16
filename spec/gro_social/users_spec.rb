require 'spec_helper'

RSpec.describe GroSocial::Users do
  describe '.[]' do
    it 'responds' do
      expect(GroSocial::Users).to respond_to(:[])
    end

    it 'returns a GroSocial::User when one exists'

    it 'returns nil when a User does not exist'
  end

  describe '.each' do
    it 'responds' do
      expect(GroSocial::Users).to respond_to(:each)
    end

    it 'returns GroSocial::User instances'
  end
end