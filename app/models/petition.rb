class Petition < ApplicationRecord
  belongs_to :event
  has_many :comments
  validates :petition_id, uniqueness: { scope: :event_id }

  def formatted_name
    event_length = event.name.length + 2
    name[event_length..name.length]
  end
end
