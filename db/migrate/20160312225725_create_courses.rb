class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :subject_name
      t.string :name
      t.integer :course_id
      t.timestamps null: false
    end
  end
end
