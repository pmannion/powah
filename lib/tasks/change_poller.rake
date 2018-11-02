# frozen_string_literal: true

namespace :petitions do
  desc 'populate petitions'
  task populate_petitions: :environment do
    event = Event.create(name: 'United Airlines')
    search_term = event.search_terms.build(name: 'United Airlines').save
    ChangeDataService.new.petitions_for_event(client: ChangeClient.new, petition_builder: ChangePetitionBuilder)
    ChangeDataService.new.petitions_for_event(client: WhitehouseClient.new, petition_builder: WhitehousePetitionBuilder)
    Petitions.pluck(:petition_id).each do |petition_id|
      ChangeDataService.new.comments_for_petition(petition_id, client: ChangeClient.new, comment_builder: ChangeCommentBuilder, offset_amount: 10)
      ChangeDataService.new.comments_for_petition(petition_id, client: WhitehouseClient.new, comment_builder: WhitehouseCommentBuilder, offset_amount: 1000)
    end
  end
end
