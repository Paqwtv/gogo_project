class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy

  after_create :create_user_profile

  def admin?
    role == 'admin'
  end

  def writer?
    role == 'writer'
  end

  def staff?
    role == 'staff'
  end

  def create_user_profile
    (self.profile = Profile.new).save!
  end
end
