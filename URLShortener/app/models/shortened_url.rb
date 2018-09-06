class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true
  attr_reader :code, :user, :long_url

  def self.generate(long_url, user)
    ShortenedUrl.new(long_url, user)
  end

  def initialize(long_url, user)
    @code = ShortenedUrl.random_code
    @user = user
    @long_url = long_url
  end

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url:code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end



end
