module RenderPartial
  def partial(page, options={})
    erb page, options.merge!(:layout => false)
  end
end

helpers RenderPartial
