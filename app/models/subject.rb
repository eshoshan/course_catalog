class Subject < ActiveRecord::Base

  validates :name, uniqueness: true
end
