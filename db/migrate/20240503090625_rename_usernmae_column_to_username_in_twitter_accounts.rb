class RenameUsernmaeColumnToUsernameInTwitterAccounts < ActiveRecord::Migration[7.1]
  def change
    rename_column :twitter_accounts, :usernmae, :username
  end
end
