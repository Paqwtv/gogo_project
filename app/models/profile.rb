class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :events
  has_many :invites
  has_many :check_ins
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :chat_rooms
end
