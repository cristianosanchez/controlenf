class DemoController < ApplicationController

  def home
      render(:template => 'demo/another')
  end

  def name
    "this is a test"      
  end

  def another
      @msg = "some message to the view"
  end

end
