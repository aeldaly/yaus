class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :original, null: false
      t.string :short, null: false, index: true

      t.timestamps
    end
  end
end
