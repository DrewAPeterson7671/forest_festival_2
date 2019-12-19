class Stage
  attr_accessor :name
  attr_reader :id

  @@stages = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all()
    @@stages.values()
  end

  def save
    @@stages[self.id] = Stage.new({ :name => self.name, :id => self.id})
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name()
  end

  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@stages[id]
  end

  def update(name)
    self.name = name
    @@stages[self.id] = Stage.new({ :name => self.name, :id => self.id })
  end

  def delete()
    @@stages.delete(self.id)
  end

  def self.search(search)
    @@stages.values().select { |a| a.name.match /#{search}/i}
  end

  def self.sort
    @@stages.values().sort_by{ |k,v| k.name}
  end

  def artists
    Artist.find_by_stage(self.id)
  end

end
