class AddRememberDigestToStaffs < ActiveRecord::Migration[4.2.2]
  def change
    add_column :staffs, :remember_digest, :string
  end
end
