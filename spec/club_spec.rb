require_relative 'spec_helper'

describe Club do     
  let(:new_club) { Club.create!(name: "2Wood") }
  let(:test_club) { Club.find_by(name: "2Wood")}
  
  it "should have a name" do  
     expect(test_club).to eq "2Wood" 
  end
      
end