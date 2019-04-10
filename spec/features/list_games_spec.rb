require 'rails_helper'

describe 'Listing the games for a campaign' do
  it 'list the games' do
    user = User.create!(user_attributes)
    campaign = Campaign.create!(campaign_attributes(user: user))
    game = campaign.games.create!(title: "A game", description: "says stuff")
    visit campaign_games_path(campaign, game)

    expect(page).to have_text(campaign.name)
    expect(page).to have_text(game.title)
    expect(page).to have_text(game.description)
    expect(page).not_to have_selector(:link_or_button, 'New Game')

  end

  it 'list the games with owner logged in' do
    user = User.create!(user_attributes)
    campaign = Campaign.create!(campaign_attributes(user: user))
    game = campaign.games.create!(title: "A game", description: "says stuff")
    sign_in(user)
    visit campaign_games_path(campaign, game)
  
    expect(page).to have_text(campaign.name)
    expect(page).to have_text(game.title)
    expect(page).to have_text(game.description)
    expect(page).to have_selector(:link_or_button, 'New Game')
  
  end
end