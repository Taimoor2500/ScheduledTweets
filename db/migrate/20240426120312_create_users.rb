class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false ##extra protection 
      t.string :password_digest

      t.timestamps
    end
  end
end
