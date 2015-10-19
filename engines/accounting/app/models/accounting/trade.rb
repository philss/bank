module Accounting
  # Public: Represents a trade in the accounting system.
  #
  # The status can be:
  # - pending: it was not executed yet;
  # - done: was executed with success;
  # - cancelled: was not executed due an error.
  #
  class Trade
    attr_reader :from_account_id, :to_account_id, :amount, :status

    def initialize(from_account_id:, to_account_id:, amount:, status: :pending)
      @from_account_id = from_account_id
      @to_account_id = to_account_id
      @amount = amount
      @status = status
    end

    def done!
      @status = :done
    end

    def cancel!
      @status = :cancelled
    end
  end
end
