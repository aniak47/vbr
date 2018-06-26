class AddPasswordDigestToStaffs < ActiveRecord::Migration[4.2.2]
  def change
    add_column :staffs, :password_digest, :string
  end
end
