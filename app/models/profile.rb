class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :events
  has_many :invites
  has_many :check_ins
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :chat_rooms

  def self.current_point(point)
    {
      position: { lat: point[0].to_f, lng: point[1].to_f },
      title: 'Current position',
      icon: 'http://maps.google.com/mapfiles/kml/paddle/blu-circle.png'
    }
  end
end
