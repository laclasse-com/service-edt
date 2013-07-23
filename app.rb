require 'rubygems'
require 'sinatra/base'
require 'filesize'
include FileUtils::Verbose


class ServiceEdt < Sinatra::Base

  helpers do 
    def to_french(size)
      size.gsub!(/[i]/, '').gsub!(/[B]/, 'o')
    end
  end  

  ['/', '/form'].each do |route|
    get route do
      @title = "Sinatra Application"
      erb :index
    end
  end
  
  # Réception des fichiers signés et cryptés
  post '/' do
    redirect '/form' if params.empty?
    
    @filename = params[:file][:filename] 
    tempfile = params[:file][:tempfile]
    @filesize = to_french Filesize.from(tempfile.length.to_s + " B").pretty
    cp(tempfile.path, "public/uploads/"+ Time.now.to_s + @filename)
    
    erb :upload_ok
  end

end
