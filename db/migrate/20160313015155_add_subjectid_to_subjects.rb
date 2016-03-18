class AddSubjectidToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :subject_id, :text
  end
end
