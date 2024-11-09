class CreateTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :types do |t|
      t.string :title
      t.integer :cost

      t.timestamps
    end
  end
end
