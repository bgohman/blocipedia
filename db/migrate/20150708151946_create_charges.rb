class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.belongs_to :user, index: true
      t.string :charge_id

      t.timestamps null: false
    end
    add_foreign_key :charges, :users
  end
end
