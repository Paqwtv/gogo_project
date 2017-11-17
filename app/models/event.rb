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
  after_validation :geocode # auto-fetch address

  before_save :address?, :lat_lng?

  scope :search, lambda { |query| where('title LIKE ?', "%#{query}%") }

  def address?
    unless self.latitude.blank? && self.longitude.blank?
      self.address.blank? ? (reverse_geocoded_by :latitude, :longitude, address: :location) : self.address
      :reverse_geocode
    end
  end

  def lat_lng?
    
  end

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
