require 'rails_helper'

RSpec.describe Movie, :type => :model do
    date = DateTime.now
    
    describe "General Propose" do
        let(:subject) { described_class.create(title: "anymovie",
                                               rating: "anyrate",
                                               description: "anydescript",
                                               release_date: date) }
                                            
        it 'Get title' do
            subject.title.should == "anymovie"
        end
        
        it 'Get rating' do
            subject.rating.should == "anyrate"
        end
        
        it 'Get description' do
            subject.description.should == "anydescript"
        end
        
        it 'Get release-date' do
            subject.release_date.should == date
        end
        
        it 'Set new title' do
            subject.title = "New Title"
            subject.save
            subject.title.should == "New Title"
        end
        
        it 'Set new rating' do
            subject.rating = "New Rating"
            subject.save
            subject.rating.should == "New Rating"
        end
        
        it 'Set new description' do
            subject.description = "New Description"
            subject.save
            subject.description.should == "New Description"
        end
    
        it 'Set new date-release_date' do
            new_date = DateTime.now + 1.week
            subject.release_date = new_date
            subject.save
            subject.release_date.should == new_date
        end
        
    end
end