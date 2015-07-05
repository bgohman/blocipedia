class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  after_initialize :init

  def init
    self.role ||= 'standard'
  end

  def upgrade
    update_attribute(:role, 'premium')
  end

  def downgrade
    update_attribute(:role, 'standard')
  end

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

  def standard?
    role == 'standard'
  end
end
