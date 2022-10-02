class Comment < ApplicationRecord
  # Adding self referential associations
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :responses, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
end
