class SpecialtyShowsController < ApplicationController
    before_action :logged_in_staff, only: [:create, :new]
    def index
    end
    def new
    end
    def create
    end
    def show
    end
end
