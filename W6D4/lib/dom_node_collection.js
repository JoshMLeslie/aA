class DOMNodeCollection {
  constructor (elements) {
    this.elements = elements;
  }

  html (string) {
    // debugger
    if (string || string === "") {
      this.elements.forEach ((el) => {
        el.innerHTML = string;
        // debugger
      });
    } else {
      return this.elements[0].innerHTML;
    }
  }

  empty () { this.html(''); }

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

  className (setter) {
      if (setter) {
        // if setting
        this.elements[0].classlist.add(setter);
    } else {
      // if no args, return any / all classes
      return this.elements[0].classname;
    }
  }

  removeClass(classNym) {
    this.elements[0].classlist.remove(classNym);
  }

  children () {
    let children = [];
    this.elements.forEach ((el) =>{
        let kid = Array
          .prototype
          .slice
          .call(el.children, 0);
        children = children.concat(kid);
    });

    return new DOMNodeCollection(children);
  }

  parent(selector) {
    const output = [];
    let type = document.querySelectorAll(selector);

    this.elements.forEach((el) => {
      let dad = el.parentNode;
      if (!output.includes(dad)) {
        if (selector) {
          type.forEach((possibleParent) => {
            if (possibleParent === dad) {
              output.push(dad);
            }
          });
        } else {
          output.push(dad);
        }
      }
    });

    return new DOMNodeCollection(output);
  }

  find (selector) {
    let mom = [];

    if (selector) {
      this.elements.forEach ((el) => {
        let tempSet = el.querySelectorAll(selector);
      // change mom to an array
        mom = mom.concat(Array
        .prototype
        .slice
        .call(tempSet, 0));
      });
    } else {
      mom = this.elements;
    }


      return new DOMNodeCollection(mom);
  }

  remove () {
    this.elements.forEach((el) => { el.remove(); });
    this.elements = [];
  }

  on (type, listener) {
    this.elements.forEach((el) => {
      el.setAttribute(`data-event-${type}`, type);
      el.addEventListener(type, listener);
    });
  }

  off (type, listener) {
    this.elements.forEach((el) => {
      el.removeAttribute(`data-event-${type}`);
      el.removeEventListener(type, listener);
    });
  }


} // class end


module.exports = DOMNodeCollection;
