class AddNameToAdmins < ActiveRecord::Migration
  def change
        add_column :admins, :name_of_admin, :string, :null => false, :default => ""
  end
end

