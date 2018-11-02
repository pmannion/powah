class WhitehouseClient
  def petitions_for_term(term)
    url = "https://api.whitehouse.gov/v1/petitions.json?title=#{term}"
    request_items(URI.encode(url))
  end

  def comments_for_petition(petition_id:, offset_pos: nil)
    offset = offset_pos ? "&offset=#{offset_pos}" : ''
    url = "https://api.whitehouse.gov/v1/petitions/#{petition_id}/signatures.json?#{offset}"
    request_items(URI.encode(url))
  end

  private

  def request_items(url)
    HTTParty.get(url).parsed_response['results']
  end

end
