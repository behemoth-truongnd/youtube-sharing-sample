class HomesController < ApplicationController
  def index
    @pagy, @videos = pagy(YoutubeVideo.includes(:user).order(id: :desc), items: DEFAULT_PER_PAGE)
  end
end
