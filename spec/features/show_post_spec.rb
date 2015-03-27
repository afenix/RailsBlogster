require 'rails_helper'

describe "show a single post" do 
  it "shows a post" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_link 'First Blog'
    expect(page).to have_content 'Some content'
  end
end