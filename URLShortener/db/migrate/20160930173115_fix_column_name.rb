class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :visits, :short_url_id, :shortened_url_id
  end
end
