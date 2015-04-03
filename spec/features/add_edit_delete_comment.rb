require 'rails_helper'

describe "add a comment to a post" do
  it "will add a comment to a post", js: true do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on "Add Comment"
    fill_in 'Body', :with => 'Nice post.'
    fill_in 'Author', :with => 'A. Author'
    click_on 'Submit'
    expect(page).to have_content "Your comment has been added."
  end
end

describe "destroy a comment" do 
  it "will allow a user to delete their comment", js: true do
    post = FactoryGirl.create(:post)
    comment = FactoryGirl.create(:comment)
    visit post_path(post)
    click_on "Delete"
    expect(page).to have_no_content comment
  end
end

describe "edit a comment" do
  it "edits a comment", js: true do
    comment = FactoryGirl.create(:comment)
    visit edit_post_comment_path(comment)
    fill_in 'Body', :with => "What were you thinking adding this post!?"
    click_button "Submit"
    expect(page).to have_content "What were you thinking adding this post!?"
  end
end