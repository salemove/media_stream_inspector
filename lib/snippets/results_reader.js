/**
 * expects this file string to be interpolated:
 * %{measurement_id}
 */

readResult = function(resultId) {
  return streamActivityResults[resultId];
};

return readResult(%{measurement_id});
