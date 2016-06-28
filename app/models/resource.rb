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

  # create progresses
  def create_progresses!
    raise "Record is not saved" if self.new_record?

    progresses = []

    User.all.each do |user|
      progresses << Progress.new(user: user, resource: self)
    end

    Progress.import progresses
  end
end
