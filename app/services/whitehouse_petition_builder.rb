class WhitehousePetitionBuilder < PetitionBuilder

  def transformed_data
    petition = @data
    {
     event_id: event_id,
     petition_id: petition.dig('id'),
     name: petition.dig('title'),
     total_signatures: petition.dig('signatureCount'),
     weekly_signatures: nil,
     victory: petition.dig('signatureCount') > petition.dig('signatureThreshold'),
     description: sanitize(petition.dig('body')),
     petition_image_url: image_url(petition.dig('title')),
     published_at: Time.at(petition.dig('created')).to_datetime,
     created_by: '',
     creator_image_url: nil,
     status: petition.dig('status'),
     targets: [],
     source: 'whitehouse.gov'
    }
  end

  def image_url(term)
    goog = GoogleCustomSearchApi.search(term, imageSize: 'medium', num: 1)
    goog.items.first.pagemap.cse_thumbnail.first.src
  rescue StandardError => e
    nil
  end
end
