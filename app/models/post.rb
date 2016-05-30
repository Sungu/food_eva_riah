class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments,dependent: :destroy
  
  def avg
    sum = 0
    comments.each do |a|
      sum += a.score
    end
    if comments.count == 0
      0
    else
      sum.to_f / comments.count
    end
  end
end
