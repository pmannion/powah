class PetitionBuilder
  attr_reader :data, :event_id

  def initialize(data:, event_id:)
    @data = data
    @event_id = event_id
    create_petition
  end

  def create_petition
    Petition.create(transformed_data)
  end

  private

  def sanitize(input)
    ActionView::Base.full_sanitizer.sanitize(input)
  end
end
