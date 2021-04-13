
'use strict';
const repeat = (fn, delay, repititions) => {
  if (repititions <= 0)
    return;
  const fnSafe = () => {
    try {
      fn();
    } catch (error) {
    }
  }
  
  // execute first time without delay
  --repititions;
  fnSafe();

  const fnWrapper = () => {
    if (--repititions < 0)
      clearInterval(intervalId);
    else
      fnSafe();
  }
  const intervalId = setInterval(fnWrapper, delay);
}
