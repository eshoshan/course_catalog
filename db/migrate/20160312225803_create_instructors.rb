class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :first
      t.string :last
      t.string :email
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
