# frozen_string_literal: true

GroundControl::Api::Engine.routes.draw do
  resources :applications, only: [:index] do
    resources :queues, only: [:index, :show] do
      scope module: :queues do
        resource :pause, only: [:create, :destroy]
      end
    end

    resources :jobs, only: [:show] do
      resource :retry, only: :create
      resource :discard, only: :create
      resource :dispatch, only: :create

      collection do
        resource :bulk_retries, only: :create
        resource :bulk_discards, only: :create
      end
    end

    resources :jobs, only: :index, path: ":status/jobs"
    resources :workers, only: [:index, :show]
    resources :recurring_tasks, only: [:index, :show, :update]
    resource :features, only: [:show]
  end
end
