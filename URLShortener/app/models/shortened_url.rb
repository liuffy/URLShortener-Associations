# Class: ShortenedUrl
class ShortenedUrl < ActiveRecord::Base
  # ASSOCIATIONS=================

  # Association to submitter
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: 'User'

  # a user could submit more than one link, so it's ok for their
  # id to show up multiple times
  validates :long_url, :short_url, :submitter_id, presence: true
  validates :short_url, uniqueness: true

  # Factory method that takes a user object and a long_url string,
  # create! a new ShortenedUrl

    def self.create_short_url!(user, long_url)
      ShortenedUrl.create!(
        submitter_id: user.id,
        long_url: long_url,
        short_url: ShortenedUrl.random_code
      )
    end

    def self.random_code
      loop do
        random_code = SecureRandom.urlsafe_base64(16)
        return random_code unless ShortenedUrl.exists?(short_url: random_code)
      end
    end

end
