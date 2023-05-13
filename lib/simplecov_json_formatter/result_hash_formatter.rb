# frozen_string_literal: true

require 'simplecov_json_formatter/source_file_formatter'

module SimpleCovJSONFormatter
  class ResultHashFormatter
    def initialize(result)
      @result = result
      @parent_path = "#{Dir.pwd}/"
    end

    def format
      format_files
      format_groups
      format_total

      formatted_result
    end

    private

    def format_files
      @result.files.each do |source_file|
        formatted_file = format_source_file(source_file)

        formatted_result[:coverage][source_file.filename] = formatted_file
        minimum_coverage_check_for_file!(source_file, formatted_file)
      end
    end

    def format_groups
      @result.groups.each do |name, file_list|
        formatted_result[:groups][name] = {
          lines: {
            covered_percent: file_list.covered_percent,
            covered_lines: file_list.covered_lines,
            missed_lines: file_list.missed_lines,
            lines_of_code: file_list.lines_of_code
          }
        }
      end
    end

    def format_total
      formatted_result[:total] = {
        covered_percent: @result.covered_percent,
        covered_lines: @result.covered_lines,
        missed_lines: @result.missed_lines,
        lines_of_code: @result.total_lines
      }
    end

    def formatted_result
      @formatted_result ||= {
        meta: {
          simplecov_version: SimpleCov::VERSION, config: config
        },
        coverage: {},
        groups: {},
        errors: { less_than_minimum_coverage: {} },
        total: {}
      }
    end

    def format_source_file(source_file)
      source_file_formatter = SourceFileFormatter.new(source_file)
      source_file_formatter.format
    end

    def config
      @config ||= {
        minimum_coverage: SimpleCov.minimum_coverage[:line],
        minimum_coverage_by_file: SimpleCov.minimum_coverage_by_file[:line]
      }
    end

    def minimum_coverage_check_for_file!(source_file, formatted_file)
      return nil unless config[:minimum_coverage_by_file]
      return nil unless formatted_file[:percent] < config[:minimum_coverage_by_file]

      file_name = source_file.filename.delete_prefix(@parent_path)
      formatted_result[:errors][:less_than_minimum_coverage][file_name] = formatted_file[:percent]
    end
  end
end
