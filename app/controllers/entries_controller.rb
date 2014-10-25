class EntriesController < ApplicationController
  def index
    @entry = Entry.new
  end

  def create
  end
end
