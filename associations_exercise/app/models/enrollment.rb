class Enrollment < ActiveRecord::Base

    #Association to user
  belongs_to( :user,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: 'User'
    )

  #Association to course
  belongs_to( :course,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: 'Course'
    )


end
