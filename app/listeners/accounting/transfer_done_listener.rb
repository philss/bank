module Accounting
  # Public: A event listener sends a message to CreditReport subsystem when executed.
  class TransferDoneListener
    def self.execute(trade)
      # CreditReport.calculate_new_report(trade)
    end
  end
end
