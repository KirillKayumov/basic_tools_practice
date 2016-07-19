Rails.application.routes.draw do
  root "pages#home"
  resource :feedback, only: %i(new create)
end
