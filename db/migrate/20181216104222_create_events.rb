class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_at, null: false
      t.datetime :end_at, null:false
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
