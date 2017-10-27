class Invite < ApplicationRecord
  belongs_to :profiles
  belongs_to :event
end
