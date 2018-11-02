class CommentBuilder
  attr_reader :data, :petition_id

  def initialize(data, petition_id)
    @data = data
    @petition_id = petition_id
    create_comment
  end

  private

  def create_comment
    Comment.create(transformed_data)
  end

end
