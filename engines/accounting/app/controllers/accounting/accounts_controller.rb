require_dependency "accounting/application_controller"

module Accounting
  class AccountsController < ApplicationController
    def index
      @accounts = Account.all
    end
  end
end
