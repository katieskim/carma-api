# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Term.create({ word: 'apple', definition: 'a red fruit' })

profiles = 
[   {:user_id => '128836', :authentication_id => 'fj3847hDI584jsh4iSjfk', :username => 'Jazzy_DJ', :organization_name => 'Ginger Tea Co.', :address => '83 Pierce Street
    Bronx, NY 10456', :phone_number => '202-555-0144', :account_created_date => '25-Nov-1992'},
    {:user_id => '198827', :authentication_id => 'ajfJei8fI584jshskjcie', :username => 'Izzi_Palindrome', :organization_name => 'Eggy Co.', :address => '2045 W Jackson Blvd
    Chicago, Illinois(IL), 60612', :phone_number => '(312) 421-3118', :account_created_date => '5-Nov-2005'},
    {:user_id => '338290', :authentication_id => 'keifjslekfiDKEI3892fj', :username => 'Katie_Kimchi', :organization_name => 'Bobalin LLC.', :address => '5 Fayonceee
        Newport Coast, California(CA), 92657', :phone_number => '(949) 421-3118', :account_created_date => '5-Jun-2013'},
]
profiles.each do |profile|
    Profile.create!(profile)
end