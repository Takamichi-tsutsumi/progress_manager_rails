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

require 'test_helper'

class ProgressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
