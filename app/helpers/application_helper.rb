module ApplicationHelper
  def audio_tag_multiple(sources)
    content_tag(:audio) do
      sources.map do |source|
        safe_concat(tag :source, source, true)
      end
    end
  end
end
