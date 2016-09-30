class User < ActiveRecord::Base

  # VALIDATIONS =================

    validates :email, presence: true, uniqueness: true # We make sure people
    #create user accounts with unique emails


  # ASSOCIATIONS =================
  # Association to submitted_urls

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: 'ShortenedUrl'

  has_many :visited_urls,
    through: :visits,
    source: :shortened_url


  has_many :visits,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: "Visit"

end
