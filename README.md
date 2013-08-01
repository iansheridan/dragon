# Dragon

A deployment tool inspired by and is using [Rye][1].

## Install

    gem install dragon

## Usage

### Dragon

      Dragon version 0.1.0

      -h     print this usage doc
      -v     print version

      Deploy:

        dragon [environment]
        dragon [environment] [release]

### Dragify

      Dragify version #{Dragon::VERSION}

      -h     print this usage doc
      -v     print version

      Deploy:

        dragify [location_to_depify]

      Example

        dragify .

----

## Copyright

Copyright (c) Ian Sheridan, 2013

## License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[1]: https://github.com/delano/rye "Rye github"