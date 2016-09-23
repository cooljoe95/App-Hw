class DOMNodeCollection {
  constructor(elements) {
    this.elements = elements;
  }

  html(tag){
    if(tag){
      debugger
      this.elements.forEach((el) => {
        el.innerHTML = tag;
      });
    } else {
      return this.elements[0].innerHTML;
    }
  }
}

module.exports = DOMNodeCollection;
