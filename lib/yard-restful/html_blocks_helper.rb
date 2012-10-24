module HtmlBlocksHelper

  def rotate(name = nil)
    @counter ||= {}
    name ||= 'odd_even'
    name = name.to_s

    @counter[name] ||= 0
    @counter[name] += 1

    elements = name.split(/[^\w]|\_/)
    @counter[name].even? ? elements[0] : elements[1]
  end

end

