require 'spec_helper'

module Accounting
  describe TransferMoney do
    subject(:use_case) { described_class }

    describe '.transfer' do
      subject(:transfer) { use_case.transfer(from_account_id: source_account.id,
                                             to_account_id: destination_account.id,
                                             amount: amount) }
      let(:amount) { 200 }

      let!(:source_account) { Account.create!(holder: 'Alice', balance: balance1) }
      let!(:destination_account) { Account.create!(holder: 'Maria', balance: balance2) }
      let(:balance2) { 0 }

      context 'when the source account has balance' do
        let(:balance1) { 500 }

        it 'transfers the money from one account to another' do
          expect { transfer }.to change {
            [
              AccountRepository.balance(account_id: source_account.id),
              AccountRepository.balance(account_id: destination_account.id)
            ]
          }.from([500, 0]).to([300, 200])
        end

        it { is_expected.to eq(:done) }

        it 'dispatch the `transfer_done` event' do
          expect(Accounting).to receive(:publish_event).with(:transfer_done, kind_of(Trade))

          transfer
        end
      end

      context 'when the source account does not have balance' do
        let(:balance1) { 0 }

        it 'does not transfer' do
          expect { transfer }.to_not change {
            [
              AccountRepository.balance(account_id: source_account.id),
              AccountRepository.balance(account_id: destination_account.id)
            ]
          }
        end

        it { is_expected.to eq(:not_enough_balance) }

        it 'does not dispatch the `transfer_done` event' do
          expect(Accounting).to_not receive(:publish_event)

          transfer
        end
      end
    end
  end
end
