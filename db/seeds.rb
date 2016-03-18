# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'
require 'open-uri'

Instructor.delete_all
Course.delete_all
Subject.delete_all
Enrollment.delete_all
Subjectcourse.delete_all

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
			elsif value == "subject"
        Subject.create(name: y['name'], subject_id: y['id'])

			elsif value == "course"
        Course.create(code: y['code'], subject_name: y['subjects'].to_s, name: y['name'], course_id: y['id'])
				a = y['subjects']
				a.each{ |b|
					x = Subject.select(:name).where(subject_id: b['id'])
					x.each { |y2|
						if !y2.name.nil?
							Subjectcourse.create(subject_name: y2.name, course_code: y['code'])
						end
					}
				}
      end
		end
	}
}
