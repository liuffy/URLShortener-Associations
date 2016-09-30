class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false #string email imput, null: false means it's required
      t.timestamps
    end

    add_index :users, :email, unique: true # adds an index for email 
  end
end
