class CreateSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :suggestions do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :sender
      t.text :comment

      t.timestamps
    end
    add_foreign_key :suggestions, :users, column: :sender_id, primary_key: :id
  end
end
