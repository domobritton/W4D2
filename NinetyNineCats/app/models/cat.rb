# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, :inclusion => {:in => ['black', 'orange', 'gray', 'white']}
  validates :sex, :inclusion => {:in => ['M', 'F']}
  
  def age
    # age = self.birth_date
    time_ago_in_words(birth_date)
  end
  
end
