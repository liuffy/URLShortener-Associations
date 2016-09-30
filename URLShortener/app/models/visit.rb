# We want to track how many times a shortened URL has been visited.
# We also want to be able to fetch all the ShortenedUrls a user has visited.
class Visit < ActiveRecord::Base

  # VALIDATIONS =================
  validates :shortened_url_id, :visitor_id, presence: true

  # ASSOCIATIONS=================
  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: 'User'

  belongs_to :shortened_url

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor_id: user.id, shortened_url_id: shortened_url.id)
  end
end
