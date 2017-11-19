class Event < ApplicationRecord
  belongs_to :profile
  has_one :snooper
  has_and_belongs_to_many :categories
  has_many :chat_rooms
  has_many :invites
  has_and_belongs_to_many :check_ins
  belongs_to :qr_invite, class_name: 'QrTech', foreign_key: 'qr_invite_id', optional: true
  belongs_to :qr_checkin, class_name: 'QrTech', foreign_key: 'qr_checkin_id', optional: true

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: lambda { |obj| obj.address.present? && obj.address_changed? }
  after_validation :reverse_geocode, if: lambda { |obj| obj.latitude_changed? || obj.longitude_changed? }

  scope :search, lambda { |query| where('title LIKE ?', "%#{query}%") }

  def self.per_page
    3
  end

  def category?(id)
    categories.map{ |e| e.id.to_s }.include?(id)
  end

  def to_point
    { position: { lat: self.latitude, lng: self.longitude },
      icon: :plase,
      title: self.title }
  end
end
