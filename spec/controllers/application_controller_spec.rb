require 'rails_helper'

describe "ApplicationController" do
  
=begin  
    it ' @current_user should not empty if session[:id] is valid' do
        user = Moviegoer.new()
        get 'index', :session => { :user_id => user.id }
        expect(session).shoud_not be_empty
    end
=end
end