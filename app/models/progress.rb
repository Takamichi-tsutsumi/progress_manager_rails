# == Schema Information
#
# Table name: progresses
#
#  id          :integer          not null, primary key
#  status      :integer          default(0), not null
#  note        :text
#  resource_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Progress < ApplicationRecord
  belongs_to :resource
  belongs_to :user

  def next_status
    2 if self.status >= 1
    1 if self.status == 0
  end
end
