/**
 * Requires variables to be passed in using Ruby string interpolation
 * %{selector}
 * %{duration}
 *
 */
var measureFor, readResult;

if (window.streamActivityResults == null) {
  window.streamActivityResults = {};
}

measureFor = function(time) {
  var activityCounter, countTimeout, increaseCount, resultId, selector, stopCounting;
  resultId = +(new Date);
  selector = '%{selector}';
  countTimeout = time;
  activityCounter = 0;
  streamActivityResults[resultId] = 0;

  increaseCount = function() {
    console.log('Increasing count', activityCounter);
    return ++streamActivityResults[resultId];
  };
  stopCounting = function() {
    $(selector).unbind('timeupdate', increaseCount);
    return streamActivityResults[resultId];
  };

  $($(selector)).bind('timeupdate', increaseCount);
  setTimeout(stopCounting, countTimeout);
  return resultId;
};

return measureFor(%{duration}*1000);
