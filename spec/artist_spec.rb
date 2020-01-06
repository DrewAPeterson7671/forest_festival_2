require('rspec')
require('festival')
require('pry')
require('artist')
require('spec_helper')

describe '#Artist' do
  before(:each) do
    Stage.clear
    Artist.clear
    @stage = Stage.new({:name => "stage 1", :id => nil})
    @stage.save()
  end

  describe('.all') do
    it('returns all artist') do
      artist = Artist.new({:name => "Jimi Hendrix", :stage_id => @stage.id, :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Doom", :stage_id => @stage.id, :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it('clears out the artists') do
      artist = Artist.new({:name => "Jimi Hendrix", :stage_id => @stage.id, :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Doom", :stage_id => @stage.id, :id => nil})
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it('save new artist') do
      artist = Artist.new({:name => "Jimi Hendrix", :stage_id => @stage.id, :id => nil})
      artist.save()
      expect(artist.name).to(eq("Jimi Hendrix"))
    end
  end
  describe('.find') do
    it('finds an artist by id') do
      artist = Artist.new({:name => "Jimi Hendrix", :stage_id => @stage.id, :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Doom", :stage_id => @stage.id, :id => nil})
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#update') do
    it('updates the artist') do
      artist = Artist.new({:name => "Jimi Hendrix", :stage_id => @stage.id, :id => nil})
      artist.save()
      artist.update("The Who", @stage.id)
      expect(artist.name).to(eq("The Who"))
    end
  end

  describe('#delete') do
    it('deletes an artist') do
      artist = Artist.new({:name => "Jimi Hendrix", :stage_id => @stage.id, :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Doom", :stage_id => @stage.id, :id => nil})
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('.find_by_stage') do
    it('finds artists by stage') do
      stage2 = Stage.new({:name => "cat", :id => nil})
      stage2.save
      artist = Artist.new({:name => "Jimi Hendrix", :stage_id => @stage.id, :id => nil})
      artist.save
      artist2 = Artist.new({:name => "Doom", :stage_id => stage2.id, :id => nil})
      artist2.save()
      expect(Artist.find_by_stage(stage2.id)).to(eq([artist2]))
    end
  end

  describe('#stage') do
    it('finds a stage an artist belongs to.') do
      artist = Artist.new({:name => "Jimi Hendrix", :stage_id => @stage.id, :id => nil})
      artist.save
      expect(artist.stage()).to(eq(@stage))
    end
  end
end
