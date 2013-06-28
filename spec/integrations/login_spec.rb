require 'spec_helper'

describe "the signin process", :js => true do
  before :each do
  FactoryGirl.create(:user, username: 'mark', password: "caplin")
  end

  it "signs user in with valid username and password" do
    login_as_user("mark", "caplin")
    uri = URI.parse(current_url)
    expect(uri.path).to eq('/')
  end

  it "tries but fails to sign in user with a valid username and an invalid password" do
    login_as_user("mark", "test")
    uri = URI.parse(current_url)
    expect(uri.path).to_not eq('/')
  end

  it "signs out the user" do
    login_as_user('mark', 'caplin')
    click_link('Logout')
    uri = URI.parse(current_url)
    expect(uri.path).to eq('/')
  end
end

def login_as_user(username, password)
  visit '/login'
  within("form") do
    fill_in 'username', :with => username
    fill_in 'password', :with => password
  end
  click_button('Login')
end
