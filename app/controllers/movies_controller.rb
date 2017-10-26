class MoviesController < ApplicationController
    def index; @movies = Movie.all; end
    
    def show
        id = params[:id]
        @movie = Movie.find(id)
    end
    
    def new; end
        
    def create
        @movie = Movie.create!(message_params)
        flash[:notice] = "#{@movie.title} was successfully created."
    end
    
    def edit; @movie = Movie.find(params[:id]); end
    
    def update
        @movie = Movie.find(params[:id])
        @movie.update_attributes!(message_params)
        flash[:notice] = "#{@movie.title} was successfully update"
        redirect_to movie_path(@movie)
    end
    
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted"
        redirect_to movies_path
    end
    
    private
    def message_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    end
end
