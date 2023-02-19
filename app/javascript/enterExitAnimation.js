const addEnterAnimation = (event) => {
  if (event.target.firstElementChild) {
    var enterAnimationClass = event.target.templateContent.firstElementChild.dataset.streamEnterClass
    if (enterAnimationClass) {
      event.target.templateElement.content.firstElementChild.classList.add(enterAnimationClass)
    }
  }
}

const addExitAnimation = (event) => {
  event.preventDefault()
  
  if (event.target.targets && event.target.action === "update") {
    var targetsClassName = event.target.targets.replace(/^\./, "")
  
    var elementsToUpdate = Object.values(document.getElementsByClassName(targetsClassName))
    const animationOfElements = elementsToUpdate.map((element) => {
      let firstChildElement = element.firstElementChild
      let streamExitClass = firstChildElement.dataset.streamExitClass
      if (streamExitClass) {
        return (
          new Promise((resolve, _) => {

            firstChildElement.classList.add(streamExitClass)
            firstChildElement.addEventListener("animationend", () => {
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
    
  } else {
    event.target.performAction()
  }
}

document.addEventListener("turbo:before-stream-render", function(event) {
  addEnterAnimation(event)
  addExitAnimation(event)
})