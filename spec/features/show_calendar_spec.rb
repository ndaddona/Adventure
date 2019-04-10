require 'rails_helper'

describe 'Viewing the calendar' do
  it 'shows the calendar' do
    user = User.create!(user_attributes)
    campaign = Campaign.create!(campaign_attributes(user: user))
    meeting = Meeting.create!(title: "Test", start_time: "2019-04-03 10:40:00", campaign: campaign)
    visit meetings_path

    expect(page).to have_text('Test - 10:40 am')

  end
end