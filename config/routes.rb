Rails.application.routes.draw do
  
  namespace :v1, defaults: {format: 'json'} do
    get 'things', to: 'things#index'
  end

  # Fwd all req to StaticController#index but req
  # must be non-Ajax (!req.xhr?) and HTML Mime type (req.format.html)
  # Doesn't include ("/") path
  get '*page', to: 'static#index', constraints: ->(req) do
    !req.xhr? && req.format.html?
  end

  # Fwd root to StaticController#index
  root 'static#index'
end
