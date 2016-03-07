# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'
require 'open-uri'

Course.delete_all
Instructor.delete_all
Subject.delete_all
Section.delete_all
User.delete_all

open("http://www.cs.brandeis.edu//~prakhar/dataset.json") do |f|
	@data = f.read
end

line = @data.split("\n")

line.each{ |x|
	y = JSON.parse(x)

	y.each{ |key, value|
		if key == "type"
			if value == "instructor"
        Instructor.create(first: y['first'], last: y['last'], email: y['email'], instructor_id: y['id'])
			elsif value == "course"
        Course.create(code: y['code'], subject_name: y['subjects'].to_s, name: y['name'], course_id: y['id'])
      elsif value == "subject"
        Subject.create(name: y['name'])
      elsif value == "section"
        Section.create(course_id: y['course'], instructor_id: y['instructors'].to_s)
      end
		end
	}
}
