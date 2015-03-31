require 'spec_helper'

describe TOTP::Password do

  describe '#generate' do
    subject { TOTP::Password.new('secret').generate }

    it { is_expected.to be_a String }
    it { is_expected.to match(/^[a-z0-9]{64}$/) }
  end


  describe '#verify' do
    let(:now) { Time.now.to_i }
    let(:secret) { 'secret' }
    let(:password) { TOTP::Password.new(secret).generate(now) }

    subject { TOTP::Password.new('secret').verify(password) }

    describe 'with valid secret' do
      describe 'in time' do
        it { is_expected.to be true }
      end

      describe 'after 5 seconds' do
        let(:now) { Time.now.to_i - 5}

        it { is_expected.to be true }
      end

      describe 'after 9 seconds' do
        let(:now) { Time.now.to_i - 9}

        it { is_expected.to be false }
      end
    end

    describe 'with invalid secret' do
      let(:secret) { 'invalid secret' }

      it { is_expected.to be false }
    end
  end # end of #verfiy
end
