(function() {

  exports.formatMMDDYYYY = function(date) {
    var dayOfMonth, month, year;
    if (!exports.validateDate(date)) return null;
    dayOfMonth = date.getDate();
    month = date.getMonth() + 1;
    year = date.getFullYear();
    return "" + month + "/" + dayOfMonth + "/" + year;
  };

  exports.validateDate = function(date) {
    if (!date || isNaN(date.getDate())) return null;
    return date;
  };

}).call(this);
