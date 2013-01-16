class Message < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user

  def self.like(content)
    content.nil? ? [] : where(['content LIKE ?', "%#{content}%"])
  end

end
