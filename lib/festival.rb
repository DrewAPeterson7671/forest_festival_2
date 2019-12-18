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



end
