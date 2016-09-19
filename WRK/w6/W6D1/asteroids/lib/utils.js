/*
We want to allow our classes to inherit from another. We could monkey-patch
Function to add an inherits method:

Function.prototype.inherits = function (ParentClass) { ... };
However, monkey-patching can cause problems and should be done judiciously.
Instead, let's create a general utilities module in lib/util.js and add our
first utility function to it as Util.inherits = function (childClass, parentClass) { ... }.

Note: You should export a POJO (plain old JavaScript object) from Util, not a
class. We don't need to create instances of Util.

*/

const Util = {

  inherits: function(childClass, parentClass) {
    function Surrogate() {}
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },

  randCoords: function(maxVel) {
    let a = [Math.random() * maxVel, Math.random() * maxVel];
    if (Math.random() < 0.5){
      a[0] = -a[0];
    }
    if (Math.random() < 0.5){
      a[1] = -a[1];
    }
    return a;
  },

  randStartingPos: function(maxVel) {
    const pos = [ [(Math.random() * maxVel), 0], [(Math.random() * maxVel), maxVel],
    [0, (Math.random() * maxVel)], [maxVel, (Math.random() * maxVel)]];

    return pos[Math.floor(Math.random() * 4)];
  },

  randColor: function() {
    const pos = "0987654321ABCDEF";
    let color = "#";
    for (let i = 0; i < 6; i++) {
      color += pos[Math.floor(Math.random() * 16)];
    }
    return color;
  }
};

module.exports = Util;
