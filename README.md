#titanium-datepicker

##Overview

This project contains the CoffeeScript and JavaScript versions of a date picker popup control for Titanium that works either on Android or iOS. It can be used as a complement to a project created with the [titanium-coffeescript template](https://github.com/alfonsocora/titanium-coffeescript)

##Dependencies

* Titanium framework
* Underscore (http://underscorejs.org/)

##Usage

Here's an example on how to instantiate the date picker for a birthday field:

```coffee
  DatePicker = require('lib/date_picker')
  DateUtils = require('lib/date_utils')

  minDate = new Date()
  minDate.setFullYear(1900)
  minDate.setMonth(1)
  minDate.setDate(1)

  selectedDate = maxDate = new Date()

  pckBirthday = DatePicker.create
    minDate: minDate
    maxDate: maxDate
    selectedDate: selectedDate
    window: window
    hook: DateUtils.formatMMDDYYYY
    properties:
      hintText: 'Birthday'
      width: '95%'
      height: '40dp'
      top: '10dp'
  form.add(pckBirthday)
```

##TODOs

This project has not been fully tested in all platforms yet. Use it at your own risk and feel free to contribute!

##License

(The MIT License)

Copyright (c) 2012 Alfonso Cora

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

##Sponsorship

This project is sponsored by the amazing people at [Cubox](http://cuboxlabs.com)

<div align="center">
  <a href="http://cuboxlabs.com">
    <img src="http://cuboxlabs.com/img/cubox-logo.png" alt="Available for Awesomeness" style="width:125px"/>
  </a>
</div>
