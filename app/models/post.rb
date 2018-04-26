class Post
  include Mongoid::Document

  field :title, type: String
  field :body, type: String

  validates :title, presence: true, uniqueness: {case_sensitive: true}

  embeds_many :comment, as: :commentable
end
