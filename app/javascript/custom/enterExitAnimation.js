const addEnterAnimation = (event) => {
  const enterAnimationClass = event.target.dataset.streamEnterClass

  if (enterAnimationClass) {
    event.target.templateElement.content.firstElementChild.classList.add(enterAnimationClass)
  }
}

const addExitAnimation = (event) => {
  event.preventDefault()
  let streamExitClass = event.target.dataset.streamExitClass

  if (streamExitClass) {
    let elementsToAddAnimation = []

    if (event.target.targets) {

      let targets = event.target.targets

      if (["replace", "remove"].includes(event.target.action)) {
        elementsToAddAnimation = Object.values(document.querySelectorAll(targets))
      } else if (["update"].includes(event.target.action)) {
        let elementParents = Object.values(document.querySelectorAll(targets))
        elementsToAddAnimation = elementParents.map((element) => element.firstElementChild)
      }
      
    } else if (event.target.target) {
      let targetId = event.target.target

      if (["replace", "remove"].includes(event.target.action)) {
        elementsToAddAnimation = [ document.getElementById(targetId) ]
      } else if (["update"].includes(event.target.action)) {
        elementsToAddAnimation = [ document.getElementById(targetId)?.firstElementChild ]
      }
      
    }
    
    addExitAnimationToElements(event, elementsToAddAnimation, streamExitClass)
    
  } else {
    event.target.performAction()
  }
}

const addExitAnimationToElements = (event, elements, exitClass) => {
  
  const animationOfElements = elements.filter(element => element).map((element) => {
    if (exitClass) {
      return (
        new Promise((resolve, _) => {

          element.classList.add(exitClass)
          element.addEventListener("animationend", () => {
            resolve()  
          })
          
        })
      );
    } else {
      return
    }
  })
  
  Promise.all(animationOfElements).then(()=> {
    event.target.performAction()
  })
}

document.addEventListener("turbo:before-stream-render", function(event) {
  addExitAnimation(event)
  addEnterAnimation(event)
})