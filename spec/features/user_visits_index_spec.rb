require 'spec_helper'

feature 'user visits index page' do
  scenario 'user sees all meetups' do
    Meetup.create(name: 'Tuesdays With Morrie', location: 'Old folks home', description: "coversations that change your life", creator: "author")
    visit '/meetups'

    expect(page).to have_content('Tuesdays')
    expect(page).to have_link('Tuesdays With Morrie')
  end
end
