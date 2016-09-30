# Class: ShortenedUrl
class ShortenedUrl < ActiveRecord::Base


  # Association to submitter
  belongs_to :submitter,
      primary_key: :id,
      foreign_key: :submitter_id,
      class_name: 'User'

    has_many :visits
      # primary_key: :id,
      # foreign_key: :short_url_id,
      # class_name: 'Visit'

    has_many :visitors,
      through: :visits,
      source: :visitor
  # VALIDATIONS =================

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

    # Write a method that will count the number of clicks on a ShortenedUrl.
    def num_clicks
      visits.count
    end

    #  determine the number of distinct users who have clicked a link.
    def num_uniques
      visits.select('visitor_id').distinct.count
    end

    # count only unique clicks in a recent time period (say, 10.minutes.ago).
    # This involves throwing a where clause onto your num_uniques code.
    def num_recent_uniques
      visits.select('visitor_id').where(created_at: (10.minutes.ago..Time.current)).distinct.count
    end
end
