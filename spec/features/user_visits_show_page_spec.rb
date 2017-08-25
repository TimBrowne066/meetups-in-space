require 'spec_helper'

feature 'user visits show page' do
  scenario 'user sees meetup info' do
    meetup = Meetup.create(name: 'Tuesdays With Morrie', location: 'Old folks home', description: "coversations with an old guy", creator: "Guy who wrote the book")
    visit '/meetups'
    click_link meetup.name

    expect(page).to have_content('Description: coversations')
    expect(page).to have_content('Location: Old folks home')
    expect(page).to have_content('Created by: Guy who')
  end
end
