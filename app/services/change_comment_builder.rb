class ChangeCommentBuilder < CommentBuilder

  def transformed_data
    {
       petition_id: petition_id,
       comment_id: @data.dig('id'),
       body: @data.dig('comment'),
       likes: @data.dig('likes'),
       user_display_name: @data.dig('user', 'display_name'),
       user_id: @data.dig('user', 'id'),
       comment_created_at: DateTime.parse(@data.dig('created_at'))
     }
  end

end
