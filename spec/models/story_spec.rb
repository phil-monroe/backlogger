require 'spec_helper'

describe Story do

  describe '#roi' do
    it 'should be 0 if no business value and story points' do
      expect(build(:story, story_points: 0, business_value: 0).roi).to eq(0)
    end

    it 'should be 0 if no story points' do
      expect(build(:story, story_points: 0, business_value: 10).roi).to eq(0)
    end

    it 'should be 0 if no business value' do
      expect(build(:story, story_points: 10, business_value: 0).roi).to eq(0)
    end

    it 'should equal business value / story points' do
      expect(build(:story, business_value: 100, story_points: 10).roi).to eq(10)
    end
  end

  describe '#overview' do
    it 'includes who what and why on separate lines' do
      overview = build(:story, who: 'foo', what: 'bar', why: 'baz').overview.split(?\n)
      expect(overview.size).to be(3)
      expect(overview[0]).to include('foo')
      expect(overview[1]).to include('bar')
      expect(overview[2]).to include('baz')
    end
  end

  describe "#compleated= and #started=" do
    let(:time) { Time.now }
    let(:story){ build(:story) }

    before(:each) { Timecop.freeze(time) }
    after(:each)  { Timecop.return }

    it "should set started_at" do
      story.started = true
      expect(story.started_at).to eq(time)
    end

    it "should set compleated_at" do
      story.compleated = true
      expect(story.compleated_at).to eq(time)
    end
  end
end
