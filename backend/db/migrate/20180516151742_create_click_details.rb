class CreateClickDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :click_details do |t|
      t.integer :click_id, null: false, index: true
      t.string :device, null: false
      t.string :ip, null: false
      t.string :ua

      t.timestamps
    end
  end
end
