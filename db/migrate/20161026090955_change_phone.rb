class ChangePhone < ActiveRecord::Migration[5.0]
  def change
    change_column :users, 
      :phone, :integer
  end

end
