class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  scope :publicly_viewable, -> { where(private: false) }

  extend FriendlyId
  friendly_id :title, use: :slugged


end
