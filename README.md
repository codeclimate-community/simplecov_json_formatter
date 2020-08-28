# JSON formatter for SimpleCov

***Note: To learn more about SimpleCov, check out the main repo at [https://github.com/simplecov-ruby/simplecov](https://github.com/colszowka/simplecov***)***

Generates a formatted JSON report of your [SimpleCov](https://github.com/simplecov-ruby/simplecov) ruby code coverage results on ruby 2.4+.

## Overview

You can expect for this gem to produce a `coverage.json` file, located at the `coverage` folder. 

Depending on your `SimpleCoV`'s settings you will experiment different outcomes. Particularly depending on which type of coverage are you running `SimpleCov` wit:

- If you configure `SimpleCov` to run with `branch` coverage you should expect an output formatted like [sample_with_branch.json](https://github.com/fede-moya/simplecov_json_formatter/blob/master/spec/fixtures/sample_with_branch.json)
- Otherwise you should expect an output formatted like [sample.json](https://github.com/fede-moya/simplecov_json_formatter/blob/master/spec/fixtures/sample.json)

## Copyright

See License ?
