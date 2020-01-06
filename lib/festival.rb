class Stage
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.get_stages(db_query)
    returned_stages = DB.exec(db_query)
    stages = []
    returned_stages.each() do |stage|
      name = stage.fetch('name')
      id = stage.fetch('id').to_i
      stages.push(Stage.new({:name => name, :id => id}))
    end
    stages
  end

  def self.all()
    self.get_stages("SELECT * FROM stages;")
  end

  def save
    result = DB.exec("INSERT INTO stages (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name()
  end

  def self.clear
    DB.exec('DELETE FROM stages *;')
  end

  def self.find(id)
    self.get_stages("SELECT * FROM stages WHERE id = #{id};").first
  end

  def update(name)
    @name = name
    DB.exec("UPDATE stages SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete()
    DB.exec("DELETE FROM stages WHERE id = #{@id};")
  end

  def self.search(search)
    self.get_stages("SELECT * FROM stages WHERE lower(name) LIKE '%#{search.downcase}%';")
  end

  def self.sort
    self.get_stages("SELECT * FROM stages ORDER BY name;")
  end

  def artists
    Artist.find_by_stage(@id)
  end

end
