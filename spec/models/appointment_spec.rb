require 'rails_helper'

describe Appointment do
  subject { Faker::Name.unique.clear
    create :appointment }

  it { is_expected.to be_valid }

  it 'sends an email' do
    expect { subject }
      .to change { ActionMailer::Base.deliveries.count }.by(2)
  end

  describe '#scheduled_at' do
    let(:scheduled_at) { subject.scheduled_at }

    it 'is at least three days in the future' do
      expect(scheduled_at).to be > (Time.now+3.days)
    end
  end
end
