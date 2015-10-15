class CreateAccountingAccounts < ActiveRecord::Migration
  def change
    create_table :accounting_accounts do |t|
      t.string :holder
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
