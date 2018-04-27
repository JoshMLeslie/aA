# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# JOIN TABLE #
# JOIN TABLE #

class Post_Sub < ApplicationRecord
  validates :post, :sub, presence: true

  belongs_to :sub # sub_id
  belongs_to :post # post_id


end
