# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string           not null
#  author_id  :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :content, :author, :post, presence: true


  belongs_to :author,
    class_name: :User

  belongs_to :post

  belongs_to :parent,
    class_name: :Comment,
    foreign_key: :parent_comment_id,
    optional: true

  has_many :children,
    class_name: :Comment,
    foreign_key: :parent_comment_id

end
