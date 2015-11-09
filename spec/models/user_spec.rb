require_relative '../rails_helper'

describe User, type: :model do
 it "should accept a first name, last name, email, city, state, password, and password confirmation" do
   aUser = User.new
   aUser.first_name = "Chuck"
   aUser.last_name = "Norris"
   aUser.email = "chucknorris@gmail.com"
   aUser.city = "city"
   aUser.state = "state"
   aUser.password = "password"
   aUser.encrypted_password = "password"
   aUser.save
   expect(aUser.first_name).to eq "Chuck"
   expect(aUser.last_name).to eq "Norris"
   expect(aUser.email).to eq "chucknorris@gmail.com"
   expect(aUser.city).to eq "city"
   expect(aUser.state).to eq "state"
   expect(aUser.password).to eq "password"
   expect(aUser.encrypted_password).to eq "password"
 end
end
