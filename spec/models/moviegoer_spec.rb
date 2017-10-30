require 'rails_helper'

RSpec.describe Moviegoer, :type => :model do
    let(:user){ described_class.create( uid: "any id", 
                                        provider: "any provider",
                                        name: "any name",
                                        image: "any image") }
                                        
    describe "General Propose" do
        it 'Get uid' do
            user.uid.should eq "any id"
        end
        
        it 'Get provider' do
            user.provider.should eq "any provider"
        end
        
        it 'Get name' do
            user.name.should eq "any name"
        end
        
        it 'Get image path' do
           user.image.should eq "any image" 
        end
        
        it 'Create pass create_with_omniauth method' do
            size_before = Moviegoer.all.size
            auth = Hash.new
            auth["provider"] = "any provider"
            auth["uid"] = "any uid"
            auth["info"] = { :name => "any name" , :image => "any link"}
            Moviegoer.create_with_omniauth(auth)
            size_before.should < Moviegoer.all.size
        end
    end
    
    describe "Validation" do
        it 'is valid with valid attribute' do
            expect(user).to be_valid
        end
        
        it 'is not valid without uid' do
            #pass
        end
        
        it 'is not valid without provider' do
            #pass
        end
    
    end

end