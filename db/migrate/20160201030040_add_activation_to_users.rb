class AddActivationToUsers < ActiveRecord::Migration
  def change
    add_column :staffs, :activation_digest, :string
    add_column :staffs, :activated, :boolean, default: false
    add_column :staffs, :activated_at, :datetime
  end
end
