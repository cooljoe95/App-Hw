class DOMNodeCollection {
  constructor(elements) {
    // debugger
    this.elements = elements;
  }

  html(tag){
    if(tag){
      this.elements.forEach((el) => {
        el.innerHTML = tag;
      });
    } else {
      return this.elements[0].innerHTML;
    }
  }

  empty(){
    // debugger
    this.html(" ");
  }

  append(tags){
    this.elements.forEach((el) => {
      if (tags instanceof HTMLElement) {
        el.innerHTML += tags.innerHTML;
      } else if(typeof tags === 'string'){
        el.innerHTML += tags;
      } else if(typeof tags === 'object'){
        for (let i = 0; i < tags.length; i++) {
          el.innerHTML += tags[i].outerHTML;
        }
      }
    });
  }

  attr(get, set){
    for(let i = 0; i < this.elements.length; i++){
      if(typeof set === 'undefined'){
        if(this.elements[i].hasAttribute(get)){
          return this.elements[i];
        }
      } else {
        this.elements[i].setAttribute(get, set);
      }
    }
  }

  addClass(className){
    for (let i = 0; i < this.elements.length; i++) {
      let initialClass = this.elements[i].getAttribute("class");
      initialClass = initialClass === null ? className : initialClass + " " + className;
      this.elements[i].setAttribute("class", initialClass);
    }
  }

  removeClass(className) {
    if (typeof className === "undefined") {
      this.attr("class", "  ");
    } else {
      this.elements.forEach ((el) => {
        let splitAr = el.getAttribute("class").split(" ");
        const classNames = splitAr.splice(splitAr.indexOf(className), 1);
        el.setAttribute("class", splitAr);
      });
    }
  }

  children(){
    const children = [];

    this.elements.forEach ((el) => {
      children.push(el.childNodes);
    });
    return new DOMNodeCollection(children);
  }

  parent() {
    const parent = [];
    this.elements.forEach ((el) => {
      parent.push(el.parentNode);
    });
    return new DOMNodeCollection(parent);
  }

  find(selector) {
    const result = [];
    this.elements.forEach ((el) => {
      // debugger
      const nodes = el.querySelectorAll(selector);
      if(nodes.length > 0){
        result.push(nodes);
      }
    });
    return new DOMNodeCollection(result);
  }

  remove(selector){
    const removeMe = this.find(selector);
  // debugger
    removeMe.elements.forEach((el) => {
      el.forEach ((subEl) => {
        subEl.remove();
      });
    });
  }

  on(action, callback) {
    this.elements.forEach ((el) => {
      el.addEventListener(action, callback);
    });
  }

  off(action, callback){
    this.elements.forEach((el) => {
      el.removeEventListener(action, callback);
    });
  }
}

module.exports = DOMNodeCollection;
