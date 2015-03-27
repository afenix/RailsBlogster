FactoryGirl.define do 
  
  factory(:post) do
    title('First Blog')
    body('Some content')
    author('A. Name')
    id(2)
  end
  
  factory(:comment) do
    body('Comment content')
    author('Another Name')
    post_id(2)
    id(4)
  end
end