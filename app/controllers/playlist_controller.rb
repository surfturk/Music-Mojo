class PlaylistController < ApplicationController
    
    get '/playlists/new' do
        erb :'/playlists/new'
       end
       
       post '/playlists/new' do
         @playlist = current_user.playlists.create!(
           playlist_name: params[:playlist_name], 
           genre: params[:genre], 
           artist: params[:artist], 
           song: params[:song])
           @playlist.save
        erb :"/playlists/show"
          #  else
          #   redirect "/error"
          # end  
       end   
       
       get '/playlists/show' do
        @playlist =  Playlist.find_by(params[:id])
         erb :'/playlists/show'
       end
       
       get '/playlists/:id' do
          @playlist = Playlist.find(params[:id])
          if @playlist.user == current_user
          erb :'/playlists/show'
          else
            redirect :'/playlists'
       end   
      end
       
       get '/playlists' do
         @playlist = current_user.playlists.all
        #  @current_user = current_user.playlist
         erb :'/playlists/index'
       end  
    
       
       
       get '/playlists/:id/edit' do
           if current_user
         @playlist = Playlist.find(params[:id])
         erb :'/playlists/edit'
           else
           redirect :"/" 
           end
      end 
       
       patch '/playlists/:id' do
           @playlist = Playlist.find_by(params[:id]).update!(
           playlist_name: params[:playlist_name], 
           genre: params[:genre], 
           artist: params[:artist], 
           song: params[:song])
           redirect to "/playlists/show"
       end    
       
       
       delete '/playlists/:id' do
           @playlist = Playlist.find(params[:id])
           @playlist.destroy
           redirect "/playlists"
           
       end   


end