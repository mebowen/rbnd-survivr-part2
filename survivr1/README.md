# Colorizr

Colorizr is a simple ruby gem to colorize terminal output by modifying the String class. 

### Features

Colorizr can output text in the following colors:
* red
* green
* yellow
* blue
* pink
* light blue
* white
* light grey
* black


### Installation 

##### You can download and unzip the zip file, or clone this repo using:
``` 
$ git clone https://github.com/mebowen/survivr1.git
```

##### Then, in the terminal window, create the following directory:
``` 
cd survivr1
```

##### And run the following commands:
``` 
$ gem build colorizr.gemspec
$ gem install colorizrz-0.0.2.gem
```

### Usage Instructions

##### To use colorizr, require colorizr in your ruby file, like so:
``` 
require 'colorizr' 
``` 

##### You can colorize your ouput by using any of the following String methods:
```
 .red
 .green
 .yellow
 .blue
 .pink
 .light_blue
 .white
 .light_grey
 .black
```

Example:
```
puts "This is a green string.".green
```

##### Other available Class methods:
```
String.colors               # returns an array of all the available colors
String.sample_colors        # displays examples of all the available colors
```

### License
Colorizr is distributed under MIT license. 





