class User < ActiveRecord::Base

  #Association to Course
  has_many(:enrolled_courses,
    through: :enrollments,
    source: :course
  )

  #Association to Enrollment

  has_many(:enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: 'Enrollment'
  )
end
