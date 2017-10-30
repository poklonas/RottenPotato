require 'rails_helper'

RSpec.describe LoginController, type: :controller do
    describe 'login page access' do
        it ' should render login homepage page if access /login' do
           get 'homepage'
           response.should render_template('homepage')
        end
    end
end
