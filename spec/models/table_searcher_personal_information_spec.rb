#For some reasons the table names are not pluralized?
require 'spec_helper'
require 'rails_helper'


describe TableSearcherPersonalInformation do
  it "has a valid factory" do
    FactoryGirl.create(:table_searcher_personal_information).should be_valid
  end
  it "is not valid without residence" do
    #FactoryGirl.build(:table_searcher_personal_information, residence: nil).should_not be_valid Change this!
  end
end

# // I removed --warnings becausee it was giving me warnings about circular require
