module Accounting
  class AccountRepository
    def self.balance(account_id:)
      account = Account.find_by(id: account_id)

      return 0 unless account

      account.balance
    end

    def self.transfer_money(trade)
      from_account = Account.find(trade.from_account_id)
      to_account   = Account.find(trade.to_account_id)

      from_account.balance -= trade.amount
      to_account.balance += trade.amount

      [from_account, to_account].map(&:save!)

      trade.done!

      trade
    end
  end
end
