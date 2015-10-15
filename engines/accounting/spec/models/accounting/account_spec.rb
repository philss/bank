require 'spec_helper'

module Accounting
  RSpec.describe Account, type: :model do
    subject(:account) { described_class.new }

    describe '#holder' do
      it 'is valid when present' do
        account.holder = 'Philip'

        expect(account.valid?).to be(true)
      end

      it 'is invalid when missing' do
        account.holder = ''

        expect(account.valid?).to be(false)
      end
    end
  end
end
