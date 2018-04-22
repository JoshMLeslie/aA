# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author, presence: true
  validates :subs, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :sub_posts,
    foreign_key: :post_id,
    class_name: :Post_Sub,
    inverse_of: 'post'

  has_many :subs,
    through: :sub_posts,
    source: :sub

  has_many :comments
end
