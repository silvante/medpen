class ChangeVisitingForFromCLient < ActiveRecord::Migration[7.2]
  def change
    change_column :clients, :visiting_for, :integer
  end
end
