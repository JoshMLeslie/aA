# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password
  after_initialize :ensure_session_token

  has_many :subs,
    foreign_key: :moderator_id,
    class_name: :Sub

  has_many :comments



  def self.find_by_credential(username, password)
      user = User.find_by(username: username)
      if user && user.is_password?(password)
        user
      else
        nil
      end
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_token
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end


end
