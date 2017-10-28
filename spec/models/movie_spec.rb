require 'rails_helper'

RSpec.describe Movie, :type => :model do
    date = DateTime.now
    
    describe "General Propose" do
        let(:subject) { described_class.create!(title: "anymovie",
                                            rating: "anyrate",
                                            description: "anydescript",
                                            release_date: date) }
                                            
        it 'Get title' do
            expect(subject.title).to eq "anymovie"
        end
        
        it 'Get rating' do
            expect(subject.rating).to eq "anyrate"
        end
        
        it 'Get description' do
            expect(subject.description).to eq "anydescript"
        end
        
        it 'Get release-date' do
            expect(subject.release_date).to eq date
        end
        
        it 'Set new title' do
            subject.title = "New Title"
            subject.save!
            expect(subject.title).to eq "New Title"
        end
        
        it 'Set new rating' do
            subject.rating = "New Rating"
            subject.save!
            expect(subject.rating).to eq "New Rating"
        end
        
        it 'Set new description' do
            subject.description = "New Description"
            subject.save!
            expect(subject.description).to eq "New Description"
        end
    
        it 'Set new date-release_date' do
            new_date = DateTime.now + 1.week
            subject.release_date = new_date
            subject.save!
            expect(subject.release_date).to eq new_date
        end
        
    end
end