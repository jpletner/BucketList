require_relative '../rails_helper'

describe Picture, type: :model do
    it "should belong to an adventure" do
        aAdventure = Adventure.new
        aAdventure.title = "Run a Marathon"

        anAdventureImage = Picture.new

        anAdventureImage.adventure = aAdventure
        expect(anAdventureImage.adventure).to eq aAdventure
    end
end
