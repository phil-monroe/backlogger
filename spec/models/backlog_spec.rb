require 'spec_helper'

describe Backlog do

  describe '#total_complexity' do

    it 'should be the sum of all story complexities' do
      backlog = create(:backlog)
      expect(backlog.total_complexity).to equal(backlog.stories.uncompleted.map(&:story_points).inject(:+))
    end
  end
end
