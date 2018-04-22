# create_table "courses", force: :cascade do |t|
#   t.string "name"
#   t.integer "prereq_id"
#   t.integer "instructor_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class Course < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: "Enrollment"

  has_many :enrolled_students,
    through: :enrollments,
    source: :students

  belongs_to :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: "Course"

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: "User"

end
