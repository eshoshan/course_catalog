class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :course_code
      t.string :user_email
      t.timestamps null: false
    end
  end
end
