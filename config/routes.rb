Rails.application.routes.draw do
  get '/show/:id' => 'resumes#show'
end
