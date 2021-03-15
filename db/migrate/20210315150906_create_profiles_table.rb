class CreateProfilesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|

      t.string :user_id                   #identification number - unique
      t.string :authentication_id         #cognito authentication number -unique
      t.string :username                  #user chosen username. -unique
      t.string :organization_name         #name of the company/COP/other organization
      t.string :first_name                 
      t.string :last_name        
      t.string :address                   #address of the organization
      t.string :phone_number              #phone number of organization
      t.datetime :account_created_date    #date of account creation 

      t.timestamps   #this was already here
    end
  end
end
