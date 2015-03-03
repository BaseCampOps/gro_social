require 'spec_helper'
require 'vcr_helper'

RSpec.describe GroSocial::User do
  let(:now) { DateTime.now }

  let(:attributes) do
    {
      id:             '123',
      firstname:      'John',
      lastname:       'Doe',
      email:          'jdoe@example.com',
      password:       'password',
      phone:          '(555) 123-4567',
      created:        now.to_s,
      custom1:        '123',
      custom2:        '456',
      custom3:        '789',
      alertmessage:   'ALERT!'
    }
  end

  %w{id firstname lastname email password phone created custom1 custom2 custom3 alertmessage}.each do |field|
    it { expect(subject).to respond_to(field.to_sym) }
  end

  describe '.new' do
    let(:subject) { GroSocial::User.new(attributes) }

    context 'with valid attributes' do
      it 'sets attributes correctly' do
        expect(subject.id).to eq('123')
        expect(subject.firstname).to eq('John')
        expect(subject.lastname).to eq('Doe')
        expect(subject.email).to eq('jdoe@example.com')
        expect(subject.phone).to eq('(555) 123-4567')
        expect(subject.created).to eq(now.to_s)
        expect(subject.custom1).to eq('123')
        expect(subject.custom2).to eq('456')
        expect(subject.custom3).to eq('789')
        expect(subject.alertmessage).to eq('ALERT!')
      end
    end

    context 'with unknown attributes' do
      let(:attributes) { {
          id:         '123',
          firstname:  'John',
          lastname:   'Doe',
          unknown:    'ALERT!',

      } }

      it 'sets known attributes correctly' do
        expect(subject.id).to eq('123')
        expect(subject.firstname).to eq('John')
        expect(subject.lastname).to eq('Doe')
      end

      it 'ignores unknown attributes' do
        expect { subject }.to_not raise_error
        expect(subject.instance_variable_get(:@unknown)).to be_nil
        expect(subject).to_not respond_to(:unknown)
        expect(subject).to_not respond_to(:unknown=)
      end
    end
  end

  describe '#attributes' do
    subject { (GroSocial::User.new attributes).attributes }
    it { should eq attributes }
  end

  describe '#subscription', :vcr do
    subject { (GroSocial::User.new id: 20183).subscription }
    it { should be_a_kind_of GroSocial::Subscription }
  end
end
