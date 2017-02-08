require 'rails_helper'

RSpec.feature "User deletes an existing artist" do
  scenario "they go to artist page and click delete button" do
    artist_1 = Artist.create(name: "Brad Mehldau",
                                        image_path: "https://i.ytimg.com/vi/XDDr5TwpJYY/maxresdefault.jpg")

    visit artist_path(artist_1)

    click_on "Delete"

    expect(page).to_not have_content artist_1.name
    expect(page).to_not have_content artist_1.image_path

  end
end
