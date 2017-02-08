require 'rails_helper'

RSpec.feature "User sees each artist on index view" do
  scenario "artists exist in database" do
    artist_1 = Artist.create(name: "Brad Mehldau",
                                        image_path: "https://i.ytimg.com/vi/XDDr5TwpJYY/maxresdefault.jpg")
    artist_2 = Artist.create(name: "John Coltrane",
                                        image_path: "http://thekey.xpn.org/aatk/files/2013/07/john-coltrane-france-651.jpg")

    visit artists_path

    expect(page).to have_content artist_1.name
    expect(page).to have_content artist_2.name

    expect(page).to have_link artist_1.name, href: artist_path(artist_1)
    expect(page).to have_link artist_2.name, href: artist_path(artist_2)
  end
end

