require 'rails_helper'

describe "destroy a blog post" do 
  it "annihilates a blog post" do 
    test_post = Post.create(title: "First Blog", body: "Happiness is blogging.", author: "Unknown")
    visit posts_path(test_post)
    click_button "Delete"
    expect(page).to change(Post, :count).by(-1)
  end
end