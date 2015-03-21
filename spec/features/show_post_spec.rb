require 'rails_helper'

describe "the show a single post" do 
  it "shows a post" do
    Post.create(title: "First Blog", body: "Happiness is blogging.", author: "Unknown")
    visit posts_path
    click_link 'First Blog'
    expect(page).to have_content "Happiness is blogging."
  end
end