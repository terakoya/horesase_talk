class EntriesController < ApplicationController
  def index
    @entry = Entry.new
    @entries = Entry.order('created_at DESC') # 本当はページングしたい
  end

  def create
    @entry = Entry.new(entry_params)
    # とりあえずはランダムで名言を選びます
    meigen = Meigen.sample
    @entry.image_url = meigen.image_url
    if @entry.save
      flash[:notice] = '投稿しました!'
      redirect_to :root
    else
      flash[:error] = '投稿に失敗しました!'
      render :index
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:content)
  end
end
