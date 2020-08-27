# frozen_string_literal: true

module SimpleCovJSONFormatter
  class SourceFileFormatter
    def initialize(source_file)
      @source_file = source_file
    end

    def format
      {
        lines: lines,
        branches: branches
      }
    end

    private

    def lines
      lines = []
      @source_file.lines.each do |line|
        lines << parse_line(line)
      end

      lines
    end

    def branches
      branches = []
      @source_file.branches.each do |branch|
        branches << parse_branch(branch)
      end

      branches
    end

    def parse_line(line)
      return line.coverage unless line.skipped?

      'ignored'
    end

    def parse_branch(branch)
      {
        type: branch.type,
        start_line: branch.start_line,
        end_line: branch.end_line,
        coverage: parse_line(branch)
      }
    end
  end
end
