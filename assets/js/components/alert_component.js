import React, { useState } from "react"

import useUrlInputState from '../hooks/use_url_input_state'
import CopyClipboardSubmitButton from './CopyClipboardSubmitButton'

export default ({error}) => {
	if(error && error.length > 0) {
		return (
			<span
				className="bg-red-100 border border-red-400 text-red-700 px-4 mt-4 mb-4 rounded relative block"
				role="alert"
			>
				<strong className="font-bold">{error}</strong>
			</span>
		)
	} else {
		return null
	}
}