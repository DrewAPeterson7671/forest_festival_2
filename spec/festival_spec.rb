require('rspec')
require('festival')
require('pry')

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
  describe('#==') do
    it("is the same stage if it has the same attributes as another stage") do
      stage = Stage.new({:name => "stage 1", :id => nil})
      stage2 = Stage.new({:name => "stage 1", :id => nil})
      expect(stage).to(eq(stage2))
    end
  end
  describe('.find') do
    it("finds a stage by id") do
      stage = Stage.new({:name => "stage 1", :id => nil})
      stage.save()
      stage2 = Stage.new({:name => "stage 2", :id => nil})
      stage2.save()
      expect(Stage.find(stage.id)).to(eq(stage))
    end
  end
  describe('#update') do
    it('updates name of stage') do
      stage = Stage.new({:name => "stage 1", :id => nil})
      stage.save()
      stage.update("stageX")
      expect(stage.name).to(eq('stageX'))
    end
  end
  describe('#delete') do
    it('deletes stage by id') do
      stage = Stage.new({:name => "stage 1", :id => nil})
      stage.save()
      stage2 = Stage.new({:name => "stage 2", :id => nil})
      stage2.save()
      stage.delete()
      expect(Stage.all).to(eq([stage2]))
    end
  end
  describe('.search') do
    it('searches for stages by name') do
      stage = Stage.new({:name => "stage 1", :id => nil})
      stage.save()
      stage2 = Stage.new({:name => "stage 2", :id => nil})
      stage2.save()
      stage3 = Stage.new({:name => "big_auditorium", :id => nil})
      stage3.save()
      expect(Stage.search("stage")).to(eq([stage, stage2]))
    end
  end
  describe('.sort') do
    it('sorts the stages by name') do
      stage = Stage.new({:name => "stage 1", :id => nil})
      stage.save()
      stage2 = Stage.new({:name => "stage 2", :id => nil})
      stage2.save()
      stage3 = Stage.new({:name => "big_auditorium", :id => nil})
      stage3.save()
      expect(Stage.sort()).to(eq([stage3, stage, stage2]))
    end
  end
end
