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
}

module.exports = DOMNodeCollection;
