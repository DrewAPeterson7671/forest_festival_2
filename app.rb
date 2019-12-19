require('sinatra')
require('sinatra/reloader')
require('./lib/festival')
require('./lib/artist')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  redirect to('/stages')
end
get('/stages') do
  @stages = Stage.sort
  erb(:stages)
end

get('/stages/new') do
  erb(:new_stage)
end

get('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @artists = Artist.find_by_stage(@stage.id)
  erb(:stage)
end

post('/stages') do
  name = params[:stage]
  stage = Stage.new({:name => name, :id => nil})
  stage.save
  redirect to('/stages')
end

get('/stages/:id/edit') do
  @stage = Stage.find(params[:id].to_i())
  erb(:edit_stage)
end

patch('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @stage.update(params[:name])
  redirect to('/stages')
end

delete('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @stage.delete()
  redirect to('/stages')
end

get('/stages/:id/artists/:artist_id') do
  @stage = Stage.find(params[:id].to_i())
  @artist = Artist.find(params[:artist_id].to_i())
  erb(:artist)
end

post('/stages/:id/artists') do
  @stage = Stage.find(params[:id].to_i())
  name = params[:name]
  artist = Artist.new({:name => name, :stage_id => @stage.id, :id => nil})
  artist.save
  @artists = Artist.find_by_stage(@stage.id)
  erb(:stage)
end

patch('/stages/:id/artists/:artist_id') do
  @stage = Stage.find(params[:id].to_i())
  artist = Artist.find(params[:artist_id].to_i())
  artist.update(params[:name], @stage.id)
  @artists = Artist.find_by_stage(@stage.id)
  erb(:stage)
end
delete('/stages/:id/artists/:artist_id') do
  artist = Artist.find(params[:artist_id].to_i())
  artist.delete()
  @artists = Artist.find_by_stage(params[:id].to_i())
  redirect to("/stages/#{artist.stage_id}")
end

get('/custom_route') do

end
