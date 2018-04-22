class User < ApplicationRecord
  validates :name, presence: true

  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Response"

  has_many :polls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Poll"
end
