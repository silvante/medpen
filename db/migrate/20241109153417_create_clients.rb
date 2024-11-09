class CreateClients < ActiveRecord::Migration[7.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.integer :born_id
      t.string :from
      t.text :visiting_for
      t.integer :paid
      t.text :diagnos
      t.date :date_of_visit

      t.timestamps
    end
  end
end
