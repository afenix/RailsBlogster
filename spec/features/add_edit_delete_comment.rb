require "rails_helper"

describe "the add a comment process" do 
  it "adds a new comment to a post" do
    visit new_post_comment_path
    click_on "Add Comment"
    fill_in "Author", :with => "A. Fan"
    fill_in "Body", :with => "Love your words!"
    click_on "Submit"
    expect(new_post_comment_path).to have_content 'posts'
  end

  it "gives an error message when there is no title entered" do
    visit new_post_path
    click_on "Submit"
    expect(page).to have_content 'problem'
  end

  it "gives a success message when each element in the form is filled out" do
    visit new_post_path
    fill_in "Title", :with => "First Blog Post"
    fill_in "Author", :with => "Virginia Woolf"
    fill_in "Body", :with => "Language is wine upon the lips"
    click_on "Submit"
    expect(page).to have_content 'successfully'
  end
end

end