class PlaylistController < ApplicationController
    
  get '/playlists/new' do
    erb :'/playlists/new'
  end
       
  post '/playlists/new' do
    check_login
      @playlist = current_user.playlists.create!(
      playlist_name: params[:playlist_name], 
      genre: params[:genre], 
      artist: params[:artist], 
      song: params[:song])
      @playlist.save
      erb :"/playlists/show"   
  end     
       
  get '/playlists/:id' do
    check_login
    @playlist = Playlist.find_by(id:params[:id])
    if @playlist.user == current_user
      erb :'/playlists/show'
    else
      redirect :'/playlists'
    end   
  end
       
  get '/playlists' do
    @playlist = current_user.playlists.all
    erb :'/playlists/index'
  end  
    
       
       
  get '/playlists/:id/edit' do
    check_login
    if current_user == playlist.user_id
    @playlist = Playlist.find_by(id:params[:id])
      erb :'/playlists/edit'
    else
      redirect :"/" 
    end
  end 
       
  patch '/playlists/:id' do
    
    @playlist = Playlist.find_by(id:params[:id])
      @playlist.update(
      playlist_name: params[:playlist_name], 
      genre: params[:genre], 
      artist: params[:artist], 
      song: params[:song])
      redirect to :"/playlists/#{@playlist.id}"
  
  end    
       
       
  delete '/playlists/:id' do
    @playlist = Playlist.find_by(id:params[:id])
    @playlist.destroy
    redirect :"/playlists"
  end   

end