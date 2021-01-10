
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    #should use Active Record to grab all of the articles and store them in an instance variable, @articles
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    #creates a new article from the params from the form, then redirects to that new article's show page.
    @article = Article.create(params)
    erb :show
  end


  get '/articles/:id' do 
    id = params[:id]
    @article = Article.find_by(id:id)
    #use Active Record to grab the article with the id that is in the params and set it equal to @article
  end

  get '/articles/new' do
    erb :new
  end



end
