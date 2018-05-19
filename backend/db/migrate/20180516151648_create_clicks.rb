class CreateClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :clicks do |t|
      t.integer :link_id, null: false, index: true
      t.string :device, null: false
      t.string :ip, null: false
      t.string :ua

      t.timestamps
    end
  end
end
