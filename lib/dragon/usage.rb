require 'dragon/version'

class << Dragon

  def usage
<<USAGE

Dragon version #{Dragon::VERSION}

-h     print this usage doc
-v     print version

Deploy:

  dragon [environment]
  dragon [environment] [release]

USAGE
  end

  def dragify_usage
<<USAGE

Dragify version #{Dragon::VERSION}

-h     print this usage doc
-v     print version

Deploy:

  dragify [location_to_dragify]

Example

  dragify .

USAGE
  end

end