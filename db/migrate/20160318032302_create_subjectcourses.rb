class CreateSubjectcourses < ActiveRecord::Migration
  def change
    create_table :subjectcourses do |t|
      t.string :subject_name
      t.string :course_code

      t.timestamps null: false
    end
  end
end
