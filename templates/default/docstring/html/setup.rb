def init
  return if object.docstring.blank?
  sections :text
end
