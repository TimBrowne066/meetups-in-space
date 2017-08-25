# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

Meetup.destroy_all
meetup1 = Meetup.create(name: "Meetup", location: "Philly", description: "Stuff", creator:"Tim")
meetup2 = Meetup.create(name: "Dessert Rendezvous at ISS", location: "Low Earth orbit", description: "Eat freeze-dried ice cream with your favorite cosmonaut and laugh at Earthbound peasants!", creator:"ESA")
meetup3 = Meetup.create(name: "Get your ass to Mars", location: "Mars", description: "Quaid, start the reactor!", creator:"Quato")
meetup4 = Meetup.create(name: "Check out distress signal on LV-426", location: "10 lightyears past the frontier", description: "Check out the source of a strange transmission from the surface of an uncharted planet.", creator:"Weyland-Yutani Corporation")
meetup5 = Meetup.create(name: "First contact with Cardassians", location: "Bajor", description: "Meet the Cardassian political attache", creator:"United Federation of Planets")
meetup6 = Meetup.create(name: "Engage improbability drive", location: "Space, which is really, really big", description: "Something about Zaphod Beeblebrox", creator:"Arthur")
meetup7 = Meetup.create(name: "Protest for reinstatement of planet classification", location: "Pluto", description: "Fight for Pluto's right to be considered a planet, despite scientific evidence to the contrary.", creator:"Pluto")
