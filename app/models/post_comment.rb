class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :po
end
