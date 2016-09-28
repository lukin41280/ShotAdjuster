require_relative 'spec_helper'

describe Club do     
  # let(:new_club) { Club.new(name: "2Wood") }
 
  # let(:test_club) { Club.find_by(name: "2Wood")}
  describe "new club" do
  	
	  it "should have a name" do 
	     @new_club = Club.create!(name: "2Wood")

	     expect(@new_club.name).to eq "2Wood"

	  end
  end  
end