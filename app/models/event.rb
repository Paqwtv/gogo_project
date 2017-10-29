class Event < ApplicationRecord
  belongs_to :profile
  has_one :snooper
  has_and_belongs_to_many :categories
  has_many :chat_rooms
  has_many :invites
  has_and_belongs_to_many :check_ins
  belongs_to :qr_invite, class_name: 'QrTech', foreign_key: 'qr_invite_id',  optional: true
  belongs_to :qr_checkin, class_name: 'QrTech', foreign_key: 'qr_checkin_id',  optional: true
  
  geocoded_by :address
  after_validation :geocode
  scope :search, lambda {|query| where('title LIKE ?', "%#{query}%")}

  def self.per_page
    3
  end

end
