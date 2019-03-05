class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def slug
    username.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    unslug = slug.gsub("-", " ")
    self.find_by(username: unslug)
  end
end
