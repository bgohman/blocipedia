class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :publicly_viewable, -> { where(private: false) }
end
