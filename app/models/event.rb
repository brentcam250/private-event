class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    # belongs_to :attendee, class_name: "User"
    has_many :invitations, foreign_key: :attended_event_id, dependent: :destroy
    has_many :attendees, through: :invitations

    scope :past, -> { where('event_time < ?', Date.today).order(date_time: :desc) }
    scope :future, -> { where('event_time > ?', Date.today).order(date_time) }

end
