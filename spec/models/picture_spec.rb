require_relative '../rails_helper'

describe Picture, type: :model do
    it "should belong to an adventure" do
        aAdventure = Adventure.new
        aAdventure.title = "Run a Marathon"

        anAdventureImage1 = Picture.new
        anAdventureImage2 = Picture.new

        anAdventureImage1.adventure = aAdventure
        anAdventureImage2.adventure = aAdventure
        expect(anAdventureImage1.adventure).to eq aAdventure
        expect(anAdventureImage2.adventure).to eq aAdventure
    end
end
