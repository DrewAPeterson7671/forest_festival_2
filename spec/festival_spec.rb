require('rspec')
require('festival')

describe(Stage) do

  before(:each) do
    Stage.clear
  end

  describe('.all') do
    it('returns an empty array when no stages') do
      expect(Stage.all).to(eq([]))
    end
  end
  describe('#save') do
    it('saves a new stage') do
      stage = Stage.new({:name => "stage 1", :id => nil})
      stage.save()
      stage2 = Stage.new({:name => "stage 2", :id => nil})
      stage2.save()
      expect(Stage.all).to(eq([stage, stage2]))
    end
  end
  describe('#clear') do
    it('clears all stages') do
      stage = Stage.new({:name => "stage 1", :id => nil})
      stage.save()
      stage2 = Stage.new({:name => "stage 2", :id => nil})
      stage2.save()
      Stage.clear
      expect(Stage.all).to(eq([]))
    end
  end
end
