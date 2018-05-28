class MiscController < ApplicationController
  def index
  end

  def error
    @course = Course.new
  end

  def deleted
    @course = Course.new
  end
end
