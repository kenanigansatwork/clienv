JsOsaDAS1.001.00bplist00�Vscript_olet app = Application.currentApplication()
app.includeStandardAdditions = true



const dialogue = (message, options = {}) => {
	
	try {
		let dialogText, dialogObj

		if (message === "") {
			// no msg passed. default msg
			dialogText = "An error has occurred. Would you like to continue?"
		} else {
			// use the passed msg
			dialogText = message
		}

		if (options === {}) {
			// no options passed. default options.
			dialogObj = {
				message: message,
				buttons: ["Don't Continue","Continue"],
				defaultButton: "Continue",
				cancelbutton: "Don't Continue",
			}
		} else {
			// use the passed options object
			dialogObj = options
		}
		
		// call dialog box
		let result = app.displayDialog(dialogText, dialogObj)
		console.log(result)
		return result
	} catch(err) {
		//on error num e_msg e_no
		console.log(`[ERROR]: ${JSON.stringify(err)}`)
	}
}

const dialogue2 = (msg) => {
	var alertText = "An error has occurred."
	var alertMessage = "The amount of available free space is dangerously low. Would you like to continue?"
	app.displayAlert(alertText, {
	    message: alertMessage,
	    as: "critical",
	    buttons: ["Don't Continue", "Continue"],
	    defaultButton: "Continue",
	    cancelButton: "Don't Continue"
	})
	// Result: {"buttonReturned":"OK"}
}


// prompt for text input
const getTextInput = () => {
	let response = app.displayDialog("What's your name?", {
		defaultAnswer: "",
		withIcon: "note",
		buttons: ["Cancel", "Continue"],
		defaultButton: "Continue",
	})
	// result: {""buttonReturned":"Continue", "textReturned":"Jen"}
	app.displayDialog("Hello, " + (response.textReturned) + ".")
}
getTextInput()
                              � jscr  ��ޭ