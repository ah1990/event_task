class CreateEventFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :event_filters do |t|
      t.string :name
      t.json :body
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
