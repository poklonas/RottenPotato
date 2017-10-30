require 'rails_helper'

RSpec.describe Movie, :type => :model do
    date = DateTime.now
    
    describe "General Propose" do
        let(:movie) { described_class.create(title: "anymovie",
                                               rating: "anyrate",
                                               description: "anydescript",
                                               release_date: date) }
                                            
        it 'Get title' do
            movie.title.should == "anymovie"
        end
        
        it 'Get rating' do
            movie.rating.should == "anyrate"
        end
        
        it 'Get description' do
            movie.description.should == "anydescript"
        end
        
        it 'Get release-date' do
            movie.release_date.should == date
        end
        
        it 'Set new title' do
            movie.title = "New Title"
            movie.save
            movie.title.should == "New Title"
        end
        
        it 'Set new rating' do
            movie.rating = "New Rating"
            movie.save
            movie.rating.should == "New Rating"
        end
        
        it 'Set new description' do
            movie.description = "New Description"
            movie.save
            movie.description.should == "New Description"
        end
    
        it 'Set new date-release_date' do
            new_date = DateTime.now + 1.week
            movie.release_date = new_date
            movie.save
            movie.release_date.should == new_date
        end
        
    end
end