require 'spec_helper'

describe Question do
  context "testing associations" do
    it { should have_many(:votes) }
    it { should have_many(:comments) }
    it { should have_many(:answers) }
    # Not working yet
    # it { should have_many(:tagclouds) }
    it { should have_many(:tags).through(:tagclouds) }
    it { should belong_to(:user) }    
  end
  

  context "testing attr_accessible" do
    it { should allow_mass_assignment_of(:file) }
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:content) }
    it { should allow_mass_assignment_of(:path) }
    it { should allow_mass_assignment_of(:user_id) }
  end

  # context "testing validations" do
  #   # it { should validate_uniqueness_of(:email).case_insensitive }
  #   # it { should validate_uniqueness_of(:username).case_insensitive }
  #   it { should validate_presence_of(:username) }
  #   it { should validate_presence_of(:email) }
  #   it { should validate_presence_of(:password) }
  #   it { should_not allow_value("blah").for(:email) }
  #   it { should allow_value("a@b.com").for(:email) }

  #   it "does not create a user, if the email has already been taken" do
  #     user1 = FactoryGirl.create(:user, email: "goodemail@test.com")
  #     user2 = FactoryGirl.build(:user, email: "goodemail@test.com")
  #     user2.should_not be_valid
  #   end

  #   it "does not create a user, if the username has already been taken" do
  #     user1 = FactoryGirl.create(:user, username: "testusername")
  #     user2 = FactoryGirl.build(:user, username: "testusername")
  #     user2.should_not be_valid
  #   end
  # end
end
