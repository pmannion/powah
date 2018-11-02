class AddSourceToPetition < ActiveRecord::Migration[5.2]
  def change
    add_column :petitions, :source, :string
  end
end
