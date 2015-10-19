module Accounting
  # Public: It moves money from one account to another, if the source account
  # has enough money.
  class TransferMoney
    def self.transfer(from_account_id:, to_account_id:, amount:)
      balance = AccountRepository.balance(account_id: from_account_id)

      return :not_enough_balance if balance < amount

      trade = Trade.new(from_account_id: from_account_id,
                        to_account_id: to_account_id,
                        amount: amount)

      AccountRepository.transfer_money(trade)

      Accounting.publish_event(:transfer_done, trade)

      trade.status
    end
  end
end
