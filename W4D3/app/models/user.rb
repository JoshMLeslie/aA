class User < ApplicationRecord

  attr_reader :password

  after_initialize :ensure_session_token

  validates :username, :password_hash, :session_token, presence: true
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 5, allow_nil: true }

  has_many :cats,
    foreign_key: :user_id,
    class_name: :Cat

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(check_username, check_password)
    # password = "frank25"
    # password_hash = 01238p192uirop1iu2iuyqewo
    user = User.find_by(username: check_username)
    if user && user.is_password?(check_password)
      return user
    end
    nil
  end


  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(new_pass)
    @password = new_pass
    self.password_hash = BCrypt::Password.create(new_pass)
  end

  def is_password?(pass)
    bcrypt_pass = BCrypt::Password.new(self.password_hash)
    bcrypt_pass.is_password?(pass) # returns bool
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  private

  def user_params
    params.require(:user).permit(:username, :password_hash, :session_token)
  end


end # class end
