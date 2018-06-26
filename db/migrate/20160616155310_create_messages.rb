class CreateMessages < ActiveRecord::Migration[4.2.2]
  def change
    create_table :messages do |t|
      t.string :target
      t.string :from
      t.string :subject
      t.text :content

      t.timestamps null: false
    end
  end
end
