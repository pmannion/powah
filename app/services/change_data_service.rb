class ChangeDataService

  def petitions_for_event(client: ChangeClient.new, petition_builder: ChangePetitionBuilder)
    SearchTerm.each do |term|
      petitions = client.petitions_for_term(term.name)
      petitions.each do|petition|
        petition_builder.new(data: petition, event_id: term.event_id)
      end
    end
  end

  def comments_for_petition(petition_id:, client: ChangeClient.new, comment_builder: ChangeCommentBuilder, offset_amount: 10)
    petition = Petition.find_by(petition_id: petition_id).id
    offset = 0
    loop do
      puts "offset is now: #{offset}"
      comments = client.comments_for_petition(petition_id: petition_id, offset_pos: offset)
      break if comments.size == 0
      comments.each do |comment|
        comment_builder.new(comment, petition)
      end
      offset += offset_amount
    end
  end

end
