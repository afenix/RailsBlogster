require 'rails_helper'

describe "destroy a blog post" do 
  it "annihilates a blog post" do 
    test_post = Post.create(title: "First Blog", body: "Happiness is blogging.", author: "Unknown")
    visit root_path
    click_on "First Blog"
    click_on 'Delete'
    expect(page).to have_content "annihilated"
  end
end