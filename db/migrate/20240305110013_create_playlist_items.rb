class CreatePlaylistItems < ActiveRecord::Migration[7.1]
  def change
    create_table :playlist_items do |t|
      t.references :playlist, null: false, foreign_key: true
      t.references :reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
