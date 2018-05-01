# create_table "users", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class User < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: "Enrollment"

  has_many :enrolled_courses,
    through: :enrollments,
    source: :courses

  has_many :instructor_courses,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: "Course"
end
