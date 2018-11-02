class CreatePetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :petitions do |t|
      t.integer :event_id, null: false
      t.integer :petition_id, null: false
      t.string :name, null: false
      t.integer :total_signatures
      t.integer :weekly_signatures
      t.boolean :victory, null: false, default: false
      t.text :description, null: false
      t.string :petition_image_url
      t.datetime :published_at, null: false
      t.string :created_by, null: false
      t.string :creator_image_url
      t.boolean :status, null: false
      t.text :targets, array: true, default: []
      t.timestamps
    end
  end
end
