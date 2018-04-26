class Comment
  include Mongoid::Document

  field :body, type: String
  field :commentable_id, type: Integer

  belongs_to :commentable, polymorphic: true
  embeds_many :comments, as: :commentable
end
