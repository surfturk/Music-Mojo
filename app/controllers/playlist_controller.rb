class PlaylistController < ApplicationController
    
    get '/playlists/new' do
        erb :'/playlists/new'
       end
       
       post '/playlists' do
         @playlist = Playlist.create(
           playlist_name: params[:playlist_name], 
           genre: params[:genre], 
           artist: params[:artist], 
           song: params[:song])
        redirect "/playlists/#{@playlist.id}"
       end   
       
       
       get '/playlists/:id' do
          @playlist = Playlist.find(params[:id])
          erb :'/playlists/show'
       end   
       
       get '/playlists' do
         @playlist = Playlist.all
         erb :'/playlists/index'
       end    
       
       
       get '/playlists/:id/edit' do
         @playlist = Playlist.find(params[:id])
         erb :'/playlists/edit'
       end
       
       
       post '/playlists/:id' do
           @playlist = Playlist.find(params[:id])
           @playlist.update(
           playlist_name: params[:playlist_name], 
           genre: params[:genre], 
           artist: params[:artist], 
           song: params[:song])
           redirect "/playlists/#{@playlist.id}"
       end    
       
       
       delete '/playlists/:id' do
           @playlist = Playlist.find(params[:id])
           @playlist.destroy_all
           redirect "/playlists"
           
       end   


end