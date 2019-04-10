require 'rails_helper'

describe 'Show a game for a campaign' do
  it 'Show a game' do
    user = User.create!(user_attributes)
    campaign = Campaign.create!(campaign_attributes(user: user))
    game = campaign.games.create!(title: "A game", description: "says stuff")
    visit campaign_game_path(campaign, game)

    expect(page).to have_text(game.title)
    expect(page).to have_text(game.description)

  end
end