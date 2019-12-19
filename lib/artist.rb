class Artist
  attr_reader :id
  attr_accessor :name, :stage_id

  @@artists = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @stage_id = attributes.fetch(:stage_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def ==(artist_to_compare)
    (self.name() == artist_to_compare.name()) && (self.stage_id() == artist_to_compare.stage_id())
  end

  def self.clear
    @@artists = {}
  end

  def self.all
    @@artists.values
  end

  def save
    @@artists[self.id] = Artist.new({:name => self.name , :stage_id => self.stage_id, :id => self.id})
  end

  def self.find(id)
    @@artists[id]
  end

  def update(name, stage_id)
    self.name = name
    self.stage_id = stage_id
    @@artists[self.id] = Artist.new ({:name => self.name, :stage_id => self.stage_id, :id => self.id})
  end

  def delete
    @@artists.delete(self.id)
  end

  def self.find_by_stage(stage)
    artists = []
    @@artists.values().each { |a| artists.push(a) if a.stage_id == stage }
    artists
  end

  def stage
    Stage.find(self.stage_id)
  end
end
