module Accounting
  # Public: It moves money from one account to another, if the source account
  # has enough money.
  class TransferMoney
    def self.transfer(from_account_id:, to_account_id:, amount:)
      balance = AccountRepository.balance(account_id: from_account_id)

      return :not_enough_balance if balance < amount

      AccountRepository.transfer_money(from_account_id: from_account_id,
                                       to_account_id: to_account_id,
                                       amount: amount)

      :ok
    end
  end
end
