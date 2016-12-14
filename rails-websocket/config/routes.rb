Rails.application.routes.draw do
  get 'ws_debugger/show'

  mount ActionCable.server => '/cable'
  get '/ws' => 'ws_debugger#show'
end
