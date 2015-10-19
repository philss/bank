require "credit_report/engine"

module CreditReport
  class << self
    def calculate_new_report(new_trade)
      puts "New trade received: #{new_trade}. Calculating.."

      42
    end
  end
end
