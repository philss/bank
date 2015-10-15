module Accounting
  class Account < ActiveRecord::Base
    validates :holder, presence: true
  end
end
