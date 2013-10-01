require "yard/redcarpet/ext/version"

require 'yard'

module YARD
  module Redcarpet
    module Ext
      CONFIG_FILE = '.yard_redcarpet_ext'.freeze
      ENV_VAR     = 'YARD_REDCARPET_EXTS'.freeze

      DEFAULT_REDCARPET_EXTS = %w[
        no_intraemphasis
        gh_blockcode
        fenced_code
        autolink
        tables
      ].freeze

      def self.exts_from_config
        return []  unless File.readable?(CONFIG_FILE)
        IO.read(CONFIG_FILE).split(/(?:\s*,\s*)|\n/)
      end

      def self.exts_from_env
        val = ENV[ENV_VAR]
        return []  unless val
        val.split(/\s*,\s*/)
      end

      def self.redcarpet_exts
        @redcarpet_exts ||= begin
          exts = []
          exts_to_remove = []
          exts += DEFAULT_REDCARPET_EXTS
          exts += exts_from_config
          exts += exts_from_env
          exts = exts.uniq.select { |ext| !ext.empty? }
          exts.each do |ext|
            if ext =~ /\A\-(.+)\z/
              exts_to_remove << $1
            end
          end          
          exts.delete_if { |elem| elem =~ /\A\-/ }
          exts_to_remove.each do |ext_to_remove|
            exts.delete_if { |elem| elem == ext_to_remove }
          end
          exts.map { |ext| ext.to_sym }
        end
      end

      def self.install
        YARD::Templates::Helpers::HtmlHelper.module_eval do
          alias :html_markup_markdown_noredcarpet :html_markup_markdown

          # Converts Markdown to HTML
          # @param [String] text input Markdown text
          # @return [String] output HTML
          # @since 0.6.0
          def html_markup_markdown(text)
            provider = markup_class(:markdown)
            if provider.to_s == 'RedcarpetCompat'
              redcarpet_exts = YARD::Redcarpet::Ext.redcarpet_exts
              provider.new(text, *redcarpet_exts).to_html
            else
              html_markup_markdown_noredcarpet(text)
            end
          end
        end
      end

      install
    end
  end
end
