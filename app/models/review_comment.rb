# == Schema Information
#
# Table name: review_comments
#
#  id         :integer          not null, primary key
#  details    :text
#  review_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReviewComment < ActiveRecord::Base
  include Aggregation
  attr_accessible :details
  belongs_to :review
  belongs_to :user

  validates :details, presence: true
  validates :review_id, presence: true
  validates :user_id, presence: true

  default_scope order: 'review_comments.created_at DESC'

  self.per_page = 15
end
