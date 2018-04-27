require 'SecureRandom'

class ShortenedUrl < ApplicationRecord
  extend SecureRandom

  validates :long_url, presence: true
  validates :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  has_many :visited_urls,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: "Visit"

  has_many :visitors,
    through: :visited_urls,
    source: :visitor # join users table


# # MAKE SHORT URL # #
  def self.random_code(user, long_url_input)
    secure_url = find_url
    
    ShortenedUrl.create(short_url: secure_url,long_url: long_url_input, user_id: user.id)
  end

  def self.find_url
    url_exists = false
    secure_url = SecureRandom.urlsafe_base64

    until url_exists?(secure_url)
      secure_url = SecureRandom.urlsafe_base64
    end

    return secure_url
  end

  def self.url_exists?(secure_url)
    url_exists = ShortenedUrl.all.none? do |shorty_obj|
      shorty_obj.short_url == secure_url
    end
  end

# # /MAKE SHORT URL/ # #

  def num_clicks
    Visit.where(short_url_id: self.id).count
  end

  def num_uniques
    Visit.where(short_url_id: self.id)
      .distinct(:user_id)
      .count
  end

  def num_recent_uniques
    time_range = (1.minute.ago..Time.now)

    Visit.where(short_url_id: self.id)
          .where(created_at: time_range)
          .distinct(:user_id)
          .count
  end
end # class
