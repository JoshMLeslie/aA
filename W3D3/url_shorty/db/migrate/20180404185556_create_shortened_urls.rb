class CreateShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url
      t.text :long_url, null: false, unique: true
      t.integer :user_id, null: false, unique: true # only stores init id

    end

    add_index :shortened_urls, :long_url
  end
end
