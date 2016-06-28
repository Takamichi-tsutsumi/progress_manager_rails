# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  url         :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Resource < ApplicationRecord
  has_many :progresses
  has_many :users, through: :progresses
end
