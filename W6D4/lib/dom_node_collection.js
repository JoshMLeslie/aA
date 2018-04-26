class DOMNodeCollection {
  constructor (elements) {
    this.elements = elements;
  }

  html (string) {
    if (string) {
      this.elements.forEach ((el) => {
        el.innerHTML = string;
      });
    } else {
      return el.innerHTML;
    }
  }

  empty () {
    this.html('');
  }

  append (element) {
    // (div).append(element)
    if (element instanceof DOMNodeCollection) {
      element.elements.forEach((el) => {
        this.elements[0].innerHTML += el.outerHTML;
      });
    } else if (element instanceof HTMLElement) {
      this.elements[0].innerHTML += element.outerHTML;
    } else if (typeof element === 'string') {
      this.elements[0].innerHTML += element;
    } else {
      console.log("What the hell?");
    }
  }

  attr (getter, setter) {
    // element.attributes
    if (getter) {
      if (setter) {
        // if setting (needs a specific k-v)
        this.elements[0].setAttribute(getter, setter);
      } else {
        // if a specific k-v is looked for
        return this.elements[0].getAttribute(getter);
      }
    } else {
      // if no args, return all k-v pairs
      return this.elements[0].attributes;
    }
  }

  addClass () {

  }

  removeClass () {

  }



}


module.exports = DOMNodeCollection;
