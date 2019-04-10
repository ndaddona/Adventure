require 'rails_helper'

describe 'Viewing the list of campaigns' do

  
  it 'shows the campaigns' do
    user = User.create!(user_attributes)
    campaign = Campaign.create!(campaign_attributes(user: user))
    

    visit campaigns_path


    expect(page).to have_text(campaign.name)
    expect(page).to have_text(campaign.description)
    expect(page).to have_text(campaign.category)

    expect(page).not_to have_selector(:link_or_button, 'New Campaign')
    expect(page).not_to have_selector(:link_or_button, "Join a Campaign")
    expect(page).not_to have_selector(:link_or_button, "All Campaigns")
    expect(page).not_to have_selector(:link_or_button, "Your Campaigns")
    expect(page).not_to have_selector(:link_or_button, "Campaigns as GM")
    expect(page).not_to have_selector(:link_or_button, "Campaigns as Player")
  end

  it 'shows the action to signed in user' do
    user = User.create!(user_attributes)
    campaign = Campaign.create!(campaign_attributes(user: user))
    sign_in(user)
    
    visit campaigns_path

    expect(page).to have_text(campaign.name)
    expect(page).to have_text(campaign.description)
    expect(page).to have_text(campaign.category)

    expect(page).to have_selector(:link_or_button, 'New Campaign')
    expect(page).to have_selector(:link_or_button, "Join a Campaign")
    expect(page).to have_selector(:link_or_button, "All Campaigns")
    expect(page).to have_selector(:link_or_button, "Your Campaigns")
    expect(page).to have_selector(:link_or_button, "Campaigns as GM")
    expect(page).to have_selector(:link_or_button, "Campaigns as Player")
  end

end
