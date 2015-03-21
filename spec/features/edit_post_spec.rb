require 'rails_helper'

describe "edit a blog post" do
  it "edits a blog title" do
    test_entry = Post.create(title: "First Blog", body: "Happiness is blogging.", author: "Unknown")
    visit edit_post_path(test_entry)
    fill_in 'Title', :with => "What is happiness?"
    click_button "Submit"
    expect(page).to have_content "What is happiness?"
  end

  it "edits a blog body" do
    test_entry = Post.create(title: "First Blog", body: "Happiness is blogging.", author: "Unknown")
    visit edit_post_path(test_entry)
    fill_in 'Body', :with => "Quiet wind on mountain."
    click_button "Submit"
    expect(page).to have_content "Quiet wind on mountain."
  end
end 
