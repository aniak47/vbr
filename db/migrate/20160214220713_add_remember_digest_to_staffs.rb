class AddRememberDigestToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :remember_digest, :string
  end
end
