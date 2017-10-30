require 'rails_helper'

# please comment before_action :require_login in movies_controller before test

describe MoviesController, :type => :controller do 
    detail = {  title: "any title",
                rating: "any rating",
                description: "any description",
                release_date: DateTime.now,
              }

    describe "Render after access" do
        it 'should render detail movie page if access root/movies/:id while login' do
            movie = Movie.create(detail)
            get 'show' , :id => movie.id
            response.should render_template('show')
        end   
    end
    
    describe "Redirect after action, while login" do
        
        it 'should redirect to movie page with flash[notice] after add movie' do
            post 'create' , :movie => {:title => 'any_title', 
                                       :rating => 'any_rate', 
                                       :description => 'any_description', 
                                       :release_date => DateTime.now, }
            response.should redirect_to(movie_path(:id => Movie.last.id))
            expect(flash[:notice]).not_to be_empty
        end  
        
        it 'should redirect to movie page with flash[notice] after edite movie' do
            movie = Movie.create(detail)
            get 'edit' , :id => movie.id
            put 'update' ,  :id => movie.id,
                            :movie => { :title => 'new_title', 
                                        :rating => 'new_rate', 
                                        :description => 'new_description', 
                                        :release_date => DateTime.now, }
            response.should redirect_to(movie_path(:id => movie.id))
            expect(flash[:notice]).not_to be_empty
        end   
        
        it ' should redirect to index page with flash[notice] after destroy movie object' do
            movie = Movie.create(detail)
            delete 'destroy' , :id => movie.id
            response.should redirect_to(movies_path)
            expect(flash[:notice]).not_to be_empty
        end   
        
    end
    
    describe "General method" do
        it 'should create new movie object after add movie' do
            size_before_add = Movie.all.size
            post 'create' , :movie => {:title => 'any_title', 
                                       :rating => 'any_rate', 
                                       :description => 'any_description', 
                                       :release_date => DateTime.now, }
            size_before_add.should < Movie.all.size                     
        end
        
        it ' should destroy movie object after delete movie' do
            movie = Movie.create(detail)
            size_before_delete = Movie.all.size
            delete 'destroy' , :id => movie.id
            size_before_delete.should > Movie.all.size
        end
        
        it ' should update attribute movie object after edite done' do
            movie = Movie.create(detail)
            new_date = DateTime.now + 1.week
            put 'update' ,  :id => movie.id,
                            :movie => { :title => 'new title', 
                                        :rating => 'new rate', 
                                        :description => 'new description', 
                                        :release_date => new_date,}
            movie = Movie.find(movie.id)
            movie.title.should eq 'new title'
            movie.rating.should eq 'new rate'
            movie.description.should eq 'new description'
            movie.release_date.should eq new_date.strftime("%Y-%m-%d %T")
        end
    end
 
end