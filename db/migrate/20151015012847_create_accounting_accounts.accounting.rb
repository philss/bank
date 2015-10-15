# This migration comes from accounting (originally 20151015011646)
class CreateAccountingAccounts < ActiveRecord::Migration
  def change
    create_table :accounting_accounts do |t|
      t.string :holder
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
