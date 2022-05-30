class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
    @lists = List.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   @bookmark.update(bookmark_params)

  #   redirect_to bookmark_path(@bookmark)
  # end

  # def destroy
  #   @bookmark.destroy

  #   redirect_to bookmarks_path
  # end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
