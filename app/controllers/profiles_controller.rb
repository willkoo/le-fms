class ProfilesController < ApplicationController
  before_action :find_profiles, only: [:index, :show, :new, :create, :edit, :update]
    def index
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def find_profiles
        @profile = Profile.find(params[:id])
    end

    def profile_params
    end
end
