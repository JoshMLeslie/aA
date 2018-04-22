# create_table "enrollments", force: :cascade do |t|
#   t.integer "course_id"
#   t.integer "student_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class Enrollment < ApplicationRecord
  belongs_to :students,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User

  belongs_to :courses,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course
end
