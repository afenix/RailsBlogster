require 'rails_helper'

describe "the add a blog process" do 
  it "adds a new post" do
    visit posts_path
    click_on "Add Post"
    fill_in "Title", :with => "First Blog Post"
    fill_in "Author", :with => "Virginia Woolf"
    fill_in "Body", :with => "Language is wine upon the lips"
    click_on "Create Post"
    expect(posts_path).to have_content 'posts'
  end

  it "gives an error message when there is no title entered" do
    visit new_post_path
    click_on "Create Post"
    expect(page).to have_content 'problem'
  end

  it "gives a success message when each element in the form is filled out" do
    visit new_post_path
    fill_in "Title", :with => "First Blog Post"
    fill_in "Author", :with => "Virginia Woolf"
    fill_in "Body", :with => "Language is wine upon the lips"
    click_on "Create Post"
    expect(page).to have_content 'successfully'
  end
end