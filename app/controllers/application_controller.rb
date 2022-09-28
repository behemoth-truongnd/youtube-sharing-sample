class ApplicationController < ActionController::Base
  include Pagy::Backend
  DEFAULT_PER_PAGE = 20
end
