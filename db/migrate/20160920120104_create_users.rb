class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :skype
      t.string :phone
      t.text :description

      t.timestamps
    end
    add_foreign_key :users, :users, column: :teacher_id
  end
end
