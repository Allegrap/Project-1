require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/album')
require_relative('../models/artist')

get '/artists' do
  @artists = Artist.all()
  erb(:"artists/index")
end

get '/artists/new' do
  erb(:"artists/new")
end

post '/artists' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:"artists/created")
end

post '/artists/:id' do
  @artist = Artist.new(params)
  @artist.update()
  erb(:"artists/updated")
end

post '/artists/:id/delete' do
  @artist = Artist.find(params[:id])
  @artist.delete()
  erb(:"artists/delete")
end

get '/artists/:id/update' do
  @artist = Artist.find(params['id'])
  erb(:"artists/update")
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  @albums = @artist.albums
  erb(:"artists/show")
end