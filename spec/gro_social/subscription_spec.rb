require 'spec_helper'
require 'vcr_helper'

RSpec.describe GroSocial::Subscription do
  let(:user_id) { 20183 }

  let(:attributes) do
    {
      user_id: user_id,
      subscriptionname: 'Subscription name',
      applicationname: 'Application name',
      extrapagescredits: 0,
      additionalfanpages: 0,
      iswhitelabel: false,
      nextpaymentdate: '2015-12-31',
      expirationdate: '2015-12-31',
      status: 'Active',
      canceled: false
    }
  end

  let(:subscription) { GroSocial::Subscription.new attributes }

  describe '#attributes' do
    subject { subscription.attributes }
    it { should eq attributes }
  end

  describe '#expirationdate=' do
    subject { subscription.expirationdate }
    before { subscription.expirationdate = Time.new 2015, 12, 31 }
    it { should eq '2015-12-31' }
  end

  describe '#nextpaymentdate=' do
    subject { subscription.nextpaymentdate }
    before { subscription.nextpaymentdate = Time.new 2015, 12, 31 }
    it { should eq '2015-12-31' }
  end

  describe '#save' do
    before { subscription.canceled = true }

    it 'saves subscription information' do
      options = {
        id: user_id,
        typhoeus: {
          body: (attributes.merge canceled: true)
        }
      }

      arguments = ['UserSubscriptions', :put, options]

      expect(GroSocial::Client).to receive(:request).with(*arguments)

      subscription.save
    end

    it 'does not raise an error', :vcr do
      expect { subscription.save }.to_not raise_error
    end
  end
end
