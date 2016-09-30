class CreateVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.timestamps
      t.string :short_url_id, null: false
      t.integer :visitor_id, null: false
    end


    add_index :visits, :visitor_id
    add_index :visits, :short_url_id
  end
end
