Rails.application.routes.draw do
  get 'items/index'
  get 'messagesitems/index'
  root to: "items#index"
end
