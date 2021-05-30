class CreateShortUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :short_urls do |t|
      t.string :key
      t.string :target_url

      t.timestamps
    end
    add_index :short_urls, :key
  end
end
