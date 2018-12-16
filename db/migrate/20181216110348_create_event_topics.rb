class CreateEventTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :event_topics do |t|
      t.references :event, foreign_key: true, index: true
      t.references :topic, foreign_key: true, index: true

      t.timestamps
    end
  end
end
