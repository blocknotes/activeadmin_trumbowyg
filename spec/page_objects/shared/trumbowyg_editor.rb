# frozen_string_literal: true

module Shared
  class TrumbowygEditor < HtmlEditor
    attr_reader :editor_selector

    def initialize(container)
      @editor_selector = "#{container} .trumbowyg-box"
      super(selector: editor_selector)
    end

    def content = content_element['innerHTML']

    def content_element
      @content_element ||= find("#{editor_selector} [contenteditable]")
    end

    def toggle_bold = find("#{editor_selector} .trumbowyg-strong-button").click

    def toggle_delete = find("#{editor_selector} .trumbowyg-del-button").click

    def toggle_italic = find("#{editor_selector} .trumbowyg-em-button").click

    def toggle_underline = find("#{editor_selector} .trumbowyg-underline-button").click
  end
end
