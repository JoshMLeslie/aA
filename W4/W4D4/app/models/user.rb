# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string           not null
#  pass_hash     :string           not null
#  session_token :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_session_token  (session_token) UNIQUE
#

class User < ApplicationRecord

  after_initialize :ensure_session_token

  # validate :valid_email # broken
  validates :email, :pass_hash, :session_token, presence: true, uniqueness: true
  validates :password, length: {minimum: 5, allow_nil: true}
  # minimum length for passing in, allow_nil for db retrieval

  attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(check_email,pw)
    user = User.find_by(email: check_email)
    (user && user.is_password?(pw) ) ? user : nil
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(pass)
    @password = pass
    self.pass_hash = BCrypt::Password.create(pass)
  end

  def is_password?(pass)
    revive_pass = BCrypt::Password.new(self.pass_hash)
    revive_pass.is_password?(pass)
  end

  # def valid_email
  #   self.email.include?("@")
  # end

end # class end
