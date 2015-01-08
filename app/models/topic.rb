class Topic < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  validates :title, :description, presence: true


end
