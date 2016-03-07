class Course < ActiveRecord::Base
  validates :code, uniqueness: true
end
