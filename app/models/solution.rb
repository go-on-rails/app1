class Solution < ActiveRecord::Base
    belongs_to :task

    serialize :selected_numbers, Array
end