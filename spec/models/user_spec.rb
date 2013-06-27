require 'spec_helper'

describe User do

  context "testing associations" do
    it { should have_many(:questions) }
    it { should have_many(:answers) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end

  context "testing attr_accessible" do
      it "should not allow access to file" do
        expect do
          User.new(file: true)
        end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end

      it "should not allow access to reputation" do
        expect do
          User.new(reputation: true)
        end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end

      it "should not allow access to location" do
        expect do
          User.new(location:  true)
        end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end

      it "should allow access to username" do
        expect do
          User.new(username:  true)
        end.to_not raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end

      it "should allow access to password" do
        expect do
          User.new(password:  true)
        end.to_not raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end

      it "should allow access to email" do
        expect do
          User.new(email: true)
        end.to_not raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
  end


  context "testing validations" do

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
