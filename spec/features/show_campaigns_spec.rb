require 'rails_helper'

describe 'Showing the campaigns' do
  it 'shows the campaign' do
    user = User.create!(user_attributes)
    campaign = Campaign.create!(campaign_attributes(user: user))
    game = campaign.games.create!(title: "A game", description: "says stuff")
    visit campaign_url(campaign)
    
    expect(page).to have_text(user.name)
    expect(page).to have_text(campaign.description)
    expect(page).to have_text(game.title)
    expect(page).to have_text(game.description)

    expect(page).not_to have_selector(:link_or_button, 'New Game')
    expect(page).not_to have_selector(:link_or_button, "New Event")
    expect(page).not_to have_selector(:link_or_button, "Edit")
    expect(page).not_to have_selector(:link_or_button, "Delete")


  end
  it 'shows the action to signed in owner' do
    user = User.create!(user_attributes)
    campaign = Campaign.create!(campaign_attributes(user: user))
    sign_in(user)
    game = campaign.games.create!(title: "A game", description: "says stuff")
    visit campaign_url(campaign)
    
    expect(page).to have_text(user.name)
    expect(page).to have_text(campaign.description)
    expect(page).to have_text(game.title)
    expect(page).to have_text(game.description)

    expect(page).to have_selector(:link_or_button, 'New Game')
    expect(page).to have_selector(:link_or_button, "New Event")
    expect(page).to have_selector(:link_or_button, "Edit")
    expect(page).to have_selector(:link_or_button, "Delete")
  end

  it 'shows the campaign with user not as owner' do
    user = User.create!(user_attributes)
    user2 = User.create!(user_attributes(name:"New", email: "new@email.com"))
    campaign = Campaign.create!(campaign_attributes(user: user))
    game = campaign.games.create!(title: "A game", description: "says stuff")
    sign_in(user2)
    visit campaign_url(campaign)
    
    expect(page).to have_text(user.name)
    expect(page).to have_text(campaign.description)
    expect(page).to have_text(game.title)
    expect(page).to have_text(game.description)

    expect(page).not_to have_selector(:link_or_button, 'New Game')
    expect(page).not_to have_selector(:link_or_button, "New Event")
    expect(page).not_to have_selector(:link_or_button, "Edit")
    expect(page).not_to have_selector(:link_or_button, "Delete")


  end

end
