# MediaStreamInspector

A tool providing Ruby API for inspecting HTML5 <video> element's stream. Also offers rspec matchers for acceptance testing (e.g. WebRTC video).

## Installation

Add this line to your application's Gemfile:

    gem 'media_stream_inspector'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install media_stream_inspector

## Usage

```ruby
active_report = StreamInspector.new('#local-video', page).detect_activity

# If the html element selected by #local-video had a stream then the object returned by
# detect_activity will have was_active? true

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Licence

The code and documentation in this repository is covered with [GPL v2 licence](http://choosealicense.com/licenses/gpl-v2/).
