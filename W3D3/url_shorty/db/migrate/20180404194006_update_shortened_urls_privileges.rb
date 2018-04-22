class UpdateShortenedUrlsPrivileges < ActiveRecord::Migration[5.1]
  def change
    change_column :shortened_urls, :user_id, :integer
  end
end
