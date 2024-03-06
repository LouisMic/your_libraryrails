class CreateReadings < ActiveRecord::Migration[7.1]
  def change
    create_table :readings do |t|
      t.references :book, null: false, foreign_key: true
      t.text :comment
      t.float :my_rating
      t.integer :reading_status
      t.string :shared_to
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
