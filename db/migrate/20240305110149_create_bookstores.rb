class CreateBookstores < ActiveRecord::Migration[7.1]
  def change
    create_table :bookstores do |t|
      t.string :address

      t.timestamps
    end
  end
end
