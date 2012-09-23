Rails.application.routes.draw do
  get '/name' => 'application#name'
  mount Merlin::Engine => "/merlin"
end
