class PlaylistController < ApplicationController
    
  get '/playlists/new' do
    erb :'/playlists/new'
  end
       
  post '/playlists/new' do
      @playlist = current_user.playlists.create(
       playlist_name: params[:playlist_name], 
       genre: params[:genre], 
       artist: params[:artist], 
       song: params[:song])
       if @playlist.save
        erb :"/playlists/show"  
       else
        flash[:message] = "Spaces left blank!!"
        redirect to :"/playlists/new"
       end
  end

  get '/playlists/:id' do
   check_login
    @playlist = Playlist.find_by(id:params[:id])
    if @playlist and @playlist.user_id == current_user.id
      erb :'/playlists/show'
    else
      redirect :'/general_error'
    end   
  end
       
  get '/playlists' do
   if @playlist = current_user.playlists.all
    erb :'/playlists/index'
   else
    redirect to :'/playlists/index'
   end  
  end 
       
       
  get '/playlists/:id/edit' do
   check_login
    @playlist = Playlist.find_by(id:params[:id])
    if @playlist and @playlist.user_id == current_user.id
        erb :'/playlists/edit'
    else
      redirect :"/general_error" 
    end
  end 
       
  patch '/playlists/:id' do
    
    @playlist = Playlist.find_by(id:params[:id])
      @playlist.update(
      playlist_name: params[:playlist_name], 
      genre: params[:genre], 
      artist: params[:artist], 
      song: params[:song])
      if @playlist.save
      redirect to :"/playlists/#{@playlist.id}"
      else
        flash[:message] = "Spaces left blank!!"
        redirect to :"/playlists/#{@playlist.id}/edit"
      end   
  end    
       
       
  delete '/playlists/:id' do
    @playlist = Playlist.find_by(id:params[:id])
    @playlist.destroy
    redirect :"/playlists"
  end   

end