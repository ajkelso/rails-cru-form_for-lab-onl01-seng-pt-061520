class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit, :update, :destroy]

    def new
        @artist = Artist.new        
    end

    def create
        @artist = Artist.new(artist_params(:name, :bio))
        if @artist.save
            redirect_to artist_path(@artist)
        else
            render :new
        end
    end

    def update
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private
    def find_artist

        @artist = Artist.find_by(id: params[:id])
    end

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end

end
