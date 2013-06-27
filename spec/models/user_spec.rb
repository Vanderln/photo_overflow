require 'spec_helper'

describe User do
  context "testing associations" do
    it { should have_many(:questions) }
    it { should have_many(:answers) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end

  context "testing attr_accessible" do
    it { should_not allow_mass_assignment_of(:file) }
    it { should_not allow_mass_assignment_of(:reputation) }
    it { should_not allow_mass_assignment_of(:location) }
    it { should allow_mass_assignment_of(:username) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:email) }
  end

  context "testing validations" do
    # it { should validate_uniqueness_of(:email).case_insensitive }
    # it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should_not allow_value("blah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }

    it "does not create a user, if the email has already been taken" do
      user1 = FactoryGirl.create(:user, email: "goodemail@test.com")
      user2 = FactoryGirl.build(:user, email: "goodemail@test.com")
      user2.should_not be_valid
    end

    it "does not create a user, if the username has already been taken" do
      user1 = FactoryGirl.create(:user, username: "testusername")
      user2 = FactoryGirl.build(:user, username: "testusername")
      user2.should_not be_valid
    end
  end
end
