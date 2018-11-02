class ChangePetitionBuilder < PetitionBuilder

  def transformed_data
    petition = @data.dig('petition')
    {
     event_id: event_id,
     petition_id: petition.dig('id'),
     name: petition.dig('title'),
     total_signatures: petition.dig('total_signature_count'),
     weekly_signatures: petition.dig('weekly_signature_count'),
     victory: petition.dig('is_victory'),
     description: sanitize(petition.dig('description')),
     petition_image_url: petition.dig('photo', 'sizes', 'medium', 'url'),
     published_at: DateTime.parse(petition.dig('published_at')),
     created_by: petition.dig('user', 'display_name'),
     creator_image_url: petition.dig('user', 'photo', 'sizes', 'medium', 'url'),
     status: petition.dig('status'),
     targets: petition.dig('targets').map { |target| target['display_name'] },
     source: 'change.org'
    }
  end

end
