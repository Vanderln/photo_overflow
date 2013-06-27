require 'spec_helper'

describe User do

  context "validations" do

    it "creates a user with a valid email address" do
      user = FactoryGirl.build(:user, email: "goodemail@gmail.com")
      user.should be_valid
    end

    it "does not create a user with an invalid email address" do
      user = FactoryGirl.build(:user, email: "bademail@com")
      user.should_not be_valid
    end

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
