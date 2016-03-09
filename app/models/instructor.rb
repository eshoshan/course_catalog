class Instructor < ActiveRecord::Base
  validates :email, uniqueness: true
end
