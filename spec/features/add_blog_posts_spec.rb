require 'rails_helper'

describe "the add a blog process" do 
  it "adds a new post" do
    visit posts_path
    click_on "Add Post"
    fill_in "Title", :with => "First Blog Post"
    fill_in "Author", :with => "Virginia Woolf"
    fill_in "Body", :with => "Language is wine upon the lips"
    click_on "Create Post"
    expect(posts_path).to have_content 'Posts'
  end
  
end