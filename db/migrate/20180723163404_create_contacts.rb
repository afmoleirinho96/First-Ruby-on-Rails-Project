class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :rmk
      t.references :kind, index: true, foreign_key: true

      t.timestamps null: false #Created_at, Updated_at
    end
  end
end
