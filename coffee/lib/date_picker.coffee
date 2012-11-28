_ = require('lib/underscore')._
DateUtils = require('lib/date_utils')

# The settings hash should follow this format:
#    minDate: minDate
#    maxDate: maxDate
#    selectedDate: selectedDate
#    window: parentWindow
#    # the hook function is completely optional
#    # it lets the caller apply a custom date format
#    hook: (date) ->
#      date.toString()
#    # settings.properties override the default control properties
#    properties:
#      hintText: 'Birthday'
#      width: '95%'
#      height: 40
#      top: 10
#
exports.create = (settings) ->
  # Avoid making titanium controls crash with invalid dates
  settings.minDate = DateUtils.validateDate(settings.minDate)
  settings.maxDate = DateUtils.validateDate(settings.maxDate)
  settings.selectedDate = DateUtils.validateDate(settings.selectedDate)

  tr = Ti.UI.create2DMatrix
    rotate: 90

  dropButton = Ti.UI.createButton
    style: Ti.UI.iPhone.SystemButton.DISCLOSURE
    transform: tr

  default_field_props =
    editable: false
    borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED
    rightButton: dropButton
    rightButtonMode: Ti.UI.INPUT_BUTTONMODE_ALWAYS
    value: if settings.hook then settings.hook(settings.selectedDate) else settings.selectedDate

  field = Ti.UI.createTextField _.extend default_field_props, settings.properties

  cancel = Ti.UI.createButton
    left: '1dp'
    height: '33dp'
    width: '64dp'
    backgroundImage: '/images/date_picker/cancel.png'

  done = Ti.UI.createButton
    right: '1dp'
    height: '33dp'
    width: '64dp'
    backgroundImage: '/images/date_picker/done.png'

  spacer = Ti.UI.createButton
    systemButton: Ti.UI.iPhone.SystemButton.FLEXIBLE_SPACE

  pickerView = Ti.UI.createView
    height: '251dp'
    bottom: -1000
    zIndex: 10
  settings.window.add(pickerView)

  toolbar = null
  if Ti.Platform.osname is 'iphone'
    toolbar = Ti.UI.createToolbar
      top: '16dp'
      backgroundColor: '#000'
      barColor: 'transparent'
      items: [cancel,spacer,done]
  else
    toolbar = Ti.UI.createView
      top: '16dp'
      width: '100%'
      height: '43dp'
      backgroundColor: '#000'
    toolbar.add cancel
    toolbar.add done

  picker = Ti.UI.createPicker
    top: '60dp'
    type: Ti.UI.PICKER_TYPE_DATE
    minDate: settings.minDate
    maxDate: settings.maxDate
    value: settings.selectedDate
  picker.selectionIndicator = true
  pickerView.add(toolbar)
  pickerView.add(picker)

  slideIn = Ti.UI.createAnimation({bottom:0})
  slideOut = Ti.UI.createAnimation({bottom:-1000})

  picker.addEventListener 'change', (e) ->
    picker.value = e.value
  field.addEventListener 'focus', ->
    pickerView.animate(slideIn)
    field.blur()
  dropButton.addEventListener 'click', ->
    pickerView.animate(slideIn)
  cancel.addEventListener 'click', ->
    pickerView.animate(slideOut)
  done.addEventListener 'click', ->
    field.value = if settings.hook then settings.hook(picker.value) else picker.value
    pickerView.animate(slideOut)

  field
