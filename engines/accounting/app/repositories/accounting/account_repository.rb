module Accounting
  class AccountRepository
    def self.balance(account_id:)
      account = Account.find_by(id: account_id)

      return 0 unless account

      account.balance
    end

    def self.transfer_money(from_account_id:, to_account_id:, amount:)
      from_account = Account.find(from_account_id)
      to_account   = Account.find(to_account_id)

      from_account.balance -= amount
      to_account.balance += amount

      [from_account, to_account].map(&:save!)
    end
  end
end
