class User < ActiveRecord::Base
  # ASSOCIATIONS=================

  # Association to submitted_urls

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: 'ShortenedUrl'

  validates :email, presence: true, uniqueness: true # We make sure people
  #create user accounts with unique emails
end
