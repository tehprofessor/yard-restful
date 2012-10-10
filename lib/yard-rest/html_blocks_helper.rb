module HtmlBlocksHelper

  def odd_or_even
    @counter ||= 1
    @counter += 1
    @counter.odd? ? 'odd' : 'even'
  end

end

