class Task < ActiveRecord::Base
    serialize :numbers, Array
    has_one :solution, dependent: :destroy
    belongs_to :history
end
