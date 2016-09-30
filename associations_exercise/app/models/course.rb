class Course < ActiveRecord::Base
  # Association to Enrollment
  has_many(:enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: 'Enrollment'
  )

  # Association to User

  has_many(:enrolled_students,
  primary_key: :id,
  foreign_key: :name,
  class_name: 'User'
  )

  # Association to prereq

  has_one(:prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: 'Course')


  belongs_to(:instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: 'User')
end
