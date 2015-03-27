require 'rails_helper'

describe "edit a blog post" do
  it "edits a blog title" do
    post = FactoryGirl.create(:post)    
    visit edit_post_path(post)
    fill_in 'Title', :with => "What is happiness?"
    click_button "Submit"
    expect(page).to have_content "What is happiness?"
  end

  it "edits a blog body" do
    post = FactoryGirl.create(:post)
    visit edit_post_path(post)
    fill_in 'Body', :with => "Quiet wind on mountain."
    click_button "Submit"
    expect(page).to have_content "Quiet wind on mountain."
  end
end

