class WhitehouseCommentBuilder < CommentBuilder

  def transformed_data
    {
       petition_id: petition_id,
       comment_id: @data.dig('id'),
       body: '',
       likes: nil,
       user_display_name: @data.dig('name'),
       user_id: 1,
       comment_created_at: Time.at(@data.dig('created').to_i).to_datetime
     }
  end
end
