module Enumerable
  def each_with_custom_index(start, step)
    self.each { |name| yield(name, start); start+=step} 
  end
end

class MoviesController < ApplicationController
    before_action :require_login
    
    def index; @movies = Movie.order('title'); end

    def show
        id = params[:id]
        @movie = Movie.find(id)
    end
    
    def new; end
        
    def create
        if params[:movie][:title] != ""
            @movie = Movie.create!(movie_params)
            flash[:notice] = "#{@movie.title} was successfully created."
            redirect_to movie_path(@movie)
        else
            flash[:notice] = "Movie title must be filled !"
            redirect_to new_movie_path
        end
    end
    
    def edit; @movie = Movie.find(params[:id]); end
    
    def update
        @movie = Movie.find(params[:id])
        @movie.update_attributes!(movie_params)
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
    def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end
