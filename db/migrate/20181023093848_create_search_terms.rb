class CreateSearchTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :search_terms do |t|
      t.string :name, null: false
      t.integer :event_id, null: false
      t.timestamps
    end
  end
end
