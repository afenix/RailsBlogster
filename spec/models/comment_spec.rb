require "rails_helper"

describe Comment do 
  it { should validate_presence_of :body }
  it { should validate_presence_of :post_id }

  it { should belong_to :post }
  it { should belong_to :user }
end