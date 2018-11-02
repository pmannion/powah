class ChangeClient

  def petitions_for_term(term)
    url = "https://www.change.org/api-proxy/-/petitions/search?q=#{term}"
    request_items(URI.encode(url))
  end

  def comments_for_petition(petition_id: petition_id, offset_pos: nil)
    offset = offset_pos ? "&offset=#{offset_pos}" : ''
    url = "https://www.change.org/api-proxy/-/comments?commentable_type=Event&commentable_id=#{petition_id}&order_by=created_at&role=comment#{offset}"
    request_items(URI.encode(url))
  end

  private

  def request_items(url)
    HTTParty.get(url).parsed_response['items']
  end

end
