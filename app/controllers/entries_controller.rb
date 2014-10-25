class EntriesController < ApplicationController
  before_action :set_entries

  def index
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    meigen = Meigen.search(entry_params[:content]) || Meigen.sample
    @entry.image_url = meigen.image_url
    if @entry.save
      flash[:notice] = '投稿しました!'
      redirect_to :root
    else
      flash[:error].now = '投稿に失敗しました!'
      render :index
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:content)
  end

  def set_entries
    @entries = Entry.order('created_at DESC').page(params[:page])
  end
end
