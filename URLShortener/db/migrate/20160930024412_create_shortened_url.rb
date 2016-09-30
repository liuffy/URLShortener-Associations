class CreateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.timestamps
      t.string :long_url, null: false
      t.string :short_url
      t.integer :submitter_id, null: false
    end


    add_index :shortened_urls, :submitter_id, unique: true
    add_index :shortened_urls, :short_url, unique: true
    # Want shortened_url to be true otherwise different long_urls
    # might lead to the same destination, and that's no good
  end
end
