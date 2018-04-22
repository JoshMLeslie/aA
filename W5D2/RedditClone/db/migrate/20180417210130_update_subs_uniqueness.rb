class UpdateSubsUniqueness < ActiveRecord::Migration[5.1]
  def change
    remove_index :subs, name: "index_subs_on_moderator_id"
  end
end
